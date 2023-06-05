package com.shiyi.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shiyi.vo.TagVO;
import com.shiyi.entity.Tags;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 博客标签表 Mapper 接口
 * </p>
 *
 * @author blue
 * @since 2021-07-19
 */
@Repository
public interface TagsMapper extends BaseMapper<Tags> {

    void saveArticleTags(@Param("articleId") Long articleId, @Param("tags")List<Long> tags);

    void deleteByArticleIds(@Param("ids") List<Long> ids);

    List<String> selectByArticleId(Long articleId);

    List<TagVO> findByArticleIdToTags(Long id);

    Page<Tags> selectPageRecord(@Param("page") Page<Tags> objectPage,@Param("name") String name);

    @MapKey("id")
    List<Map<String, Object>> countTags();

    List<TagVO> selectAll();
}
