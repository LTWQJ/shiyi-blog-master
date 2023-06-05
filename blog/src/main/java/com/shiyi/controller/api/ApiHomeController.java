package com.shiyi.controller.api;


import com.shiyi.common.ResponseResult;
import com.shiyi.service.impl.HomeServiceImpl;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author blue
 * @since 2021-09-03
 */
@CrossOrigin("*")
@RestController
@RequestMapping("/web/home")
@RequiredArgsConstructor
@Api(tags = "门户首页管理")
public class ApiHomeController {

    private final HomeServiceImpl homeService;


    @RequestMapping(value = "/webSiteInfo",method = RequestMethod.GET)
    @ApiOperation(value = "网站信息", httpMethod = "GET", response = ResponseResult.class, notes = "网站信息")
    public ResponseResult webSiteInfo(){
        return homeService.webSiteInfo();
    }

    @RequestMapping(value = "/report",method = RequestMethod.GET)
    @ApiOperation(value = "增加访问量", httpMethod = "GET", response = ResponseResult.class, notes = "增加访问量")
    public ResponseResult report(HttpServletRequest request){
        return homeService.report(request);
    }
}

