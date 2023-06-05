package com.shiyi.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shiyi.entity.Role;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 系统管理-角色表  Mapper 接口
 * </p>
 *
 * @author blue
 * @since 2021-07-30
 */
@Repository
public interface RoleMapper extends BaseMapper<Role> {

    Integer queryByUserId(Object userId);

    List<Integer> queryByRoleMenu(Integer roleId);

    void delByRoleId(@Param("roleId") Integer roleId,@Param("menus") List<Integer> menus);

    void insertBatchByRole(@Param("menus") List<Integer> menus, @Param("roleId") Integer roleId);

    @Delete("delete from b_user_role where user_id=#{userId}")
    void deleteByUserId(Integer userId);

    @Insert("insert into b_user_role(role_id,user_id) values(#{roleId},#{userId})")
    void insertToUserId(@Param("userId") Long userId,@Param("roleId") Integer roleId);

    @Update("update b_user_role set role_id=#{roleId} where user_id=#{userId}")
    void updateByUserId(@Param("userId") Long userId,@Param("roleId") Integer roleId);

    List<String> selectByUserId(Object loginId);
}
