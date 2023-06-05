package com.shiyi.dto;

import lombok.Data;

/**
 * @author blue
 * @date 2022/2/25
 * @apiNote
 */
@Data
public class UserAuthDTO {
    /**
     * 昵称
     * */
    private String nickname;
    /**
     * 简介
     * */
    private String intro;

    /**
     * 个人网站
     * */
    private String webSite;

    /**
     * 头像
     * */
    private String avatar;

   /**
     * 邮箱
     * */
    private String email;

    /**
     * 验证码
     * */
    private String code;
}
