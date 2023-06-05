package com.shiyi.controller.api;

import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author blue
 * @Description: 博客前台博客网站资源导航控制器
 * @Date 2023-05-18 20:47
 */
@CrossOrigin("*")
@RestController
@RequestMapping("/web/webnav")
@Api(tags = "前台网站资源导航管理")
@RequiredArgsConstructor
public class ApiWebNavController {

}
