package com.shiyi.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author blue
 * @date 2022/1/5
 * @apiNote
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GiteeUserInfoVO {

    /**
     * 昵称
     */
    private String name;

    /**
     * 头像
     */
    private String avatar_url;

    /**
     * id
     */
    private String id;

}
