package com.shiyi.vo;

import lombok.Data;
import org.apache.commons.lang3.StringUtils;

/**
 * @Author quequnlong
 * @Date 2022/12/14 16:43
 * @Description:
 * @Version 1.0
 */
@Data
public class SysCacheVO {
    /** 缓存名称 */
    private String cacheName = "";

    /** 缓存键名 */
    private String cacheKey = "";

    /** 缓存内容 */
    private String cacheValue = "";

    /** 备注 */
    private String remark = "";

    /** 是否访客显示 */
    private boolean show = true;

    public SysCacheVO(String cacheName, String remark,boolean show)
    {
        this.cacheName = cacheName;
        this.remark = remark;
        this.show = show;
    }

    public SysCacheVO(String cacheName, String cacheKey, String cacheValue)
    {
        this.cacheName = StringUtils.replace(cacheName, ":", "");
        this.cacheKey = StringUtils.replace(cacheKey, cacheName, "");
        this.cacheValue = cacheValue;
    }
}
