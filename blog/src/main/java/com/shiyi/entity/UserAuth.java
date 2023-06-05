package com.shiyi.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import lombok.*;

/**
 * <p>
 * 
 * </p>
 *
 * @author blue
 * @since 2021-12-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("b_user_auth")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserAuth implements Serializable {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String email;

    private String nickname;

    private String avatar;

    private String intro;

    private String webSite;

      @TableField(fill = FieldFill.INSERT)
    private Date createTime;

      @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;


}
