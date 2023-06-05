package com.shiyi.quartz;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.shiyi.entity.BlogArticle;
import com.shiyi.entity.Tags;
import com.shiyi.service.ArticleService;
import com.shiyi.common.RedisConstants;
import com.shiyi.service.CloudOssService;
import com.shiyi.service.RedisService;
import com.shiyi.service.TagsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import java.util.*;
import static com.shiyi.common.RedisConstants.ARTICLE_READING;
import static com.shiyi.common.RedisConstants.TAG_CLICK_VOLUME;

/**
 * @author blue
 * @date 2021/12/8
 * @apiNote 定时任务调度
 */
@Component("blogQuartz")
@RequiredArgsConstructor
public class BlogQuartz {
    private final RedisService redisService;

    private final ArticleService articleService;

    private final CloudOssService cloudOssService;

    private final TagsService tagsService;


    public void ryMultipleParams(String s, Boolean b, Long l, Double d, Integer i) {
        System.out.println(StringUtils.format("执行多参方法： 字符串类型{}，布尔类型{}，长整型{}，浮点型{}，整形{}", s, b, l, d, i));
    }

    public void ryParams(String params) {
        System.out.println("执行有参方法：" + params);
    }

    public void ryNoParams() {
        System.out.println("执行无参方法");
    }

    /**
     *  自动更新阅读数，每天凌晨四点更新数据
     * @author blue
     * @date: 2021/8/18 17:58
     */
    public void updateReadQuantity(){
        // 获取带阅读量的前缀key集合
        List<BlogArticle> blogArticles = new ArrayList<>();
        Map<String, Object> map = redisService.getCacheMap(ARTICLE_READING);
        // 取出所有数据更新到数据库
        for (Map.Entry<String, Object> stringEntry : map.entrySet()) {
            String id = stringEntry.getKey();
            Integer value = (Integer) stringEntry.getValue();
            BlogArticle blogArticle = BlogArticle.builder()
                    .id(Long.parseLong(id)).quantity(value)
                    .build();
            blogArticles.add(blogArticle);
        }
        articleService.updateBatchById(blogArticles);
    }

    /**
     * 删除七牛云的垃圾图片
     *
     */
    public void removeQiNiuImg(){
        Set<String> imgArrays = redisService.diff(RedisConstants.ALL_IMG, RedisConstants.APPLY_IMG);
        String[] keys = imgArrays.toArray(new String[0]);
        cloudOssService.delBatchFile(keys);
    }

    /**
     * 删除redis当天验证码通过的ip
     *
     */
    public void removeCodePassInIp(){
        redisService.deleteObject(RedisConstants.CHECK_CODE_IP);
    }

    /**
     * 每天定时修改标签的点击量
     *
     */
    public void updateTagsClickVolume(){
        Map<String, Object> map = redisService.getCacheMap(TAG_CLICK_VOLUME);
        List<Tags> tagsList = new ArrayList<>();
        for (Map.Entry<String, Object> stringEntry : map.entrySet()) {
            String id = stringEntry.getKey();
            Integer value = (Integer) stringEntry.getValue();
            Tags tags = new Tags(Long.parseLong(id),value);
            tagsList.add(tags);
        }
        tagsService.updateBatchById(tagsList);
    }
}
