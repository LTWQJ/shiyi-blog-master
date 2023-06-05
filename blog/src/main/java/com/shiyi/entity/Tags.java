package com.shiyi.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.shiyi.util.DateUtils;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

/**
 * <p>
 * 博客标签表
 * </p>
 *
 * @author blue
 * @since 2021-09-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("b_tags")
@ApiModel(value="Tags对象", description="博客标签表")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Tags implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "主键id")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "标签名称")
    private String name;

    @ApiModelProperty(value = "排序")
    private int sort;

    @ApiModelProperty(value = "点击量")
    private int clickVolume;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = DateUtils.FORMAT_STRING,timezone="GMT+8")
    private Date createTime;

    @ApiModelProperty(value = "最后更新时间")
    @TableField(fill = FieldFill.UPDATE)
    @JsonFormat(pattern = DateUtils.FORMAT_STRING,timezone="GMT+8")
    private Date updateTime;

    @TableField(exist = false)
    private int articleCount;

    public Tags(Long id, int clickVolume) {
        this.id = id;
        this.clickVolume = clickVolume;
    }
}
