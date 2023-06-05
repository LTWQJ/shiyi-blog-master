package com.shiyi.entity;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * @Title
 * @Description 说说实体
 * @Param
 * @return
 * @Author LTW
 * @Date 2023/5/24
*/

@Data
@EqualsAndHashCode(callSuper = false)
@TableName("shuoshuo")
public class Shuoshuo {
    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "说说类型")
    private String type;

    @ApiModelProperty(value = "说说类容")
    private String content;

    @ApiModelProperty(value = "说说图片")
    private String img_url;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date add_time;

}
