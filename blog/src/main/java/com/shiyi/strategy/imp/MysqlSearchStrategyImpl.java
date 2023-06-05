package com.shiyi.strategy.imp;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.shiyi.common.Constants;
import com.shiyi.vo.ArticleSearchVO;
import com.shiyi.entity.BlogArticle;
import com.shiyi.mapper.ArticleMapper;
import com.shiyi.strategy.SearchStrategy;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;

import static com.shiyi.enums.PublishEnum.PUBLISH;

@Service("mysqlStrategyImpl")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class MysqlSearchStrategyImpl implements SearchStrategy {

    private final ArticleMapper mapper;

    @Override
    public List<ArticleSearchVO> searchArticle(String keywords){
        // 搜索文章
        List<BlogArticle> blogArticles = mapper.selectList(new LambdaQueryWrapper<BlogArticle>()
                .eq(BlogArticle::getIsPublish, PUBLISH.getCode())
                .and(i -> i.like(BlogArticle::getTitle, keywords)
                        .or()
                        .like(BlogArticle::getContent, keywords)).orderByDesc(BlogArticle::getIsStick,BlogArticle::getCreateTime));
        //高亮处理
        return blogArticles.stream().map(item -> {
            // 获取关键词第一次出现的位置
            String articleContent = item.getContent();
            int index = item.getContent().indexOf(keywords);
            if (index != -1) {
                // 获取关键词前面的文字
                int preIndex = index > 25 ? index - 25 : 0;
                String preText = item.getContent().substring(preIndex, index);
                // 获取关键词到后面的文字
                int last = index + keywords.length();
                int postLength = item.getContent().length() - last;
                int postIndex = postLength > 175 ? last + 175 : last + postLength;
                String postText = item.getContent().substring(index, postIndex);
                // 文章内容高亮
                articleContent = (preText + postText).replaceAll(keywords, Constants.PRE_TAG + keywords + Constants.POST_TAG);
            }
            // 文章标题高亮
            String articleTitle = item.getTitle().replaceAll(keywords, Constants.PRE_TAG + keywords + Constants.POST_TAG);
            return ArticleSearchVO.builder()
                    .id(item.getId())
                    .title(articleTitle)
                    .content(articleContent)
                    .build();
        }).collect(Collectors.toList());
    }
}
