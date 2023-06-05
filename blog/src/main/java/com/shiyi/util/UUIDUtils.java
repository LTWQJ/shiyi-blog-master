package com.shiyi.util;

import java.util.UUID;

/**
 * UUID工具类
 *
 * @author blue
 * @since 2021-05-24
 */
public class UUIDUtils {

    /**
     * 去除UUID中的分割符
     * @return
     */
    public static String getUuid(){
        UUID uuid  =  UUID.randomUUID();
        String s = uuid.toString();//
        int p = 0;
        int j = 0;
        char[] buf = new char[32];
        while(p<s.length()){
            char c = s.charAt(p);
            p+=1;
            if(c=='-') {
                continue;
            }
            buf[j]=c;j+=1;
        }
        return new String(buf);
    }
}
