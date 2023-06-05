package com.shiyi.entity;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Title
 * @Description 网站资源导航实体
 * @Param
 * @return
 * @Author LTW
 * @Date 2023/5/18
*/
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="webnav对象", description="网站资源导航表")
@TableName("b_websitenavigation")
@AllArgsConstructor
@NoArgsConstructor
public class WebNavigation {
    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "导航网站图片地址")
    private String web_img;
    @ApiModelProperty(value = "导航网站标题")
    private String title;

    @ApiModelProperty(value = "导航网站url")
    private String web_url;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date createdate;

    @ApiModelProperty(value = "最后更新时间")
    @TableField(fill = FieldFill.UPDATE)
    private Date update;
}
