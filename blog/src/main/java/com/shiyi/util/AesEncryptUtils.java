package com.shiyi.util;

import cn.dev33.satoken.secure.SaSecureUtil;

/**
 *  <p> 加密工具 </p>
 *
 * @description:
 * @author: blue
 * @date: 2019/10/13 0013 15:25
 */
public class AesEncryptUtils {

    final static String key = "shiyi2022";
    /**
     * 校验内容是否一直
     */
    public static boolean validate(String target, String target1) {
        return target.equalsIgnoreCase(aesEncrypt(target1));
    }

    /**
     * AES加密
     *
     * @param password：密码
     * @return
     */
    public static String aesEncrypt(String password){
        return SaSecureUtil.aesEncrypt(key, password);
    }

    public static void main(String[] args) {
        System.out.println(aesEncrypt("dby123"));
    }
}
