package com.shiyi.strategy;

import com.shiyi.vo.UserInfoVO;

/**
 * @author blue
 * @date 2022/1/5
 * @apiNote
 */
public interface SocialLoginStrategy {
    /**
     * 登录
     *
     * @param data 数据
     * @return {@link UserInfoVO} 用户信息
     */
    UserInfoVO login(String data);
}
