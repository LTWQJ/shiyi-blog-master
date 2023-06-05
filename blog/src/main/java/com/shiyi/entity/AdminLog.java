package com.shiyi.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.shiyi.util.DateUtils;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.StringUtils;

/**
 * <p>
 * 
 * </p>
 *
 * @author blue
 * @since 2021-11-10
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="AdminLog对象", description="")
@TableName("b_admin_log")
public class AdminLog implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "主键ID")
      @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "操作用户")
    private String username;

    @ApiModelProperty(value = "请求接口")
    private String requestUrl;

    @ApiModelProperty(value = "请求方式")
    private String type;

    @ApiModelProperty(value = "操作名称")
    private String operationName;

    @ApiModelProperty(value = "ip")
    private String ip;

    @ApiModelProperty(value = "ip来源")
    private String source;

    @ApiModelProperty(value = "请求参数")
    private String paramsJson;

    @ApiModelProperty(value = "类地址")
    private String classPath;

    @ApiModelProperty(value = "方法名")
    private String methodName;

    @ApiModelProperty(value = "请求接口耗时")
    private Long spendTime;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = DateUtils.FORMAT_STRING,timezone="GMT+8")
    private Date createTime;

    public AdminLog(){}

    /**
     * 构造函数
     *
     * @param ip
     * @param type
     * @param requestUrl
     * @param paramsJson
     * @param classPath
     * @param methodName
     * @param operationName
     */
    public AdminLog(String ip, String source, String type, String requestUrl, String nickname,
                    String paramsJson, String classPath,
                    String methodName, String operationName,
                 Long spendTime) {
        this.ip = ip;
        this.source = StringUtils.isBlank(source) ? "未知": source;
        this.type = type;
        this.requestUrl = requestUrl;
        this.username = nickname;
        this.paramsJson = paramsJson;
        this.classPath = classPath;
        this.methodName = methodName;
        this.operationName = operationName;
        this.spendTime = spendTime;
    }
}
