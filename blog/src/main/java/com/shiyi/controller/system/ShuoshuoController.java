package com.shiyi.controller.system;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.shiyi.common.ResponseResult;
import com.shiyi.service.WebConfigService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Title
 * @Description 说说控制层
 * @Param
 * @return
 * @Author LTW
 * @Date 2023/5/24
*/
@CrossOrigin("*")
@RestController
@RequestMapping("/shuoshuo")
@Api(tags = "角色管理-接口")
@RequiredArgsConstructor
public class ShuoshuoController {




}
