package com.shiyi.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shiyi.entity.Tags;
import com.shiyi.entity.WebNavigation;
import com.shiyi.vo.ArticleListVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * @Title
 * @Description 网站资源导航mapper接口
 * @Param
 * @return
 * @Author LTW
 * @Date 2023/5/18
*/
@Mapper
public interface WebNavMapper extends BaseMapper<WebNavigation>
{

    /**
     * 后台分页获取文章
     * @param page 分页对象
     * @param map 参数map
     * @return
     */

    Page<WebNavigation> selectPageRecord(@Param("page") Page<Tags> objectPage, @Param("title") String name);
}
