package com.shiyi.mapper;

import com.shiyi.vo.FriendLinkVO;
import com.shiyi.entity.FriendLink;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 友情链接表 Mapper 接口
 * </p>
 *
 * @author blue
 * @since 2021-08-18
 */
@Repository
public interface FriendLinkMapper extends BaseMapper<FriendLink> {

    Integer getMaxSort();

    void top(@Param("id") Integer id, @Param("sort") int sort);

    List<FriendLinkVO> selectLinkList(@Param("status") Integer status);

}
