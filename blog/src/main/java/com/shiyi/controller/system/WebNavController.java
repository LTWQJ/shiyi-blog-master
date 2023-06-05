package com.shiyi.controller.system;


import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import com.shiyi.annotation.OperationLogger;
import com.shiyi.common.ResponseResult;
import com.shiyi.entity.Tags;
import com.shiyi.entity.WebNavigation;
import com.shiyi.service.WebNavService;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @Title
 * @Description
 * @Param
 * @return
 * @Author LTW
 * @Date 2023/5/18
*/
@CrossOrigin("*")
@RestController
@RequestMapping("/system/webnav")
@RequiredArgsConstructor
public class WebNavController {
    @Autowired
    private WebNavService webNavService;

    /**
     * @Title
     * @Description  获取获取网站资源导航列表
     * @Param [null]
     * @return com.shiyi.common.ResponseResult
     * @Author LTW
     * @Date 2023/5/18
    */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @SaCheckLogin
    @ApiOperation(value = "网站导航资源列表", httpMethod = "GET", response = ResponseResult.class, notes = "网站导航资源列表")
    public ResponseResult list(String title){
        return webNavService.listwebnav(title);
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @SaCheckPermission("/system/webnav/add")
    @ApiOperation(value = "新增网站导航资源", httpMethod = "POST", response = ResponseResult.class, notes = "新增网站导航资源")
    @OperationLogger(value = "新增网站导航资源")
    public ResponseResult insert(@RequestBody WebNavigation webNavigation){
        return webNavService.insertwebnva(webNavigation);
    }

    @RequestMapping(value = "/info",method = RequestMethod.GET)
    @SaCheckPermission("/system/webnav/info")
    @ApiOperation(value = "网站导航资源详情", httpMethod = "GET", response = ResponseResult.class, notes = "网站导航资源详情")
    public ResponseResult getTagsById(Integer id){
        return webNavService.getwebnavById(id);
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @SaCheckPermission("/system/webnav/update")
    @ApiOperation(value = "修改网站导航资源", httpMethod = "POST", response = ResponseResult.class, notes = "修改网站导航资源")
    @OperationLogger(value = "修改网站导航资源")
    public ResponseResult update(@RequestBody WebNavigation webNavigation){
        return webNavService.updatewebnav(webNavigation);
    }

    @RequestMapping(value = "/remove",method = RequestMethod.DELETE)
    @SaCheckPermission("/system/webnav/remove")
    @ApiOperation(value = "删除网站导航资源", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除网站导航资源")
    @OperationLogger(value = "删除网站导航资源")
    public ResponseResult deleteById(Integer  id){
        return webNavService.deleteById(id);
    }

    @RequestMapping(value = "/deleteBatch",method = RequestMethod.DELETE)
    @SaCheckPermission("/system/webnav/deleteBatch")
    @ApiOperation(value = "批量删除网站导航资源", httpMethod = "DELETE", response = ResponseResult.class, notes = "批量删除网站导航资源")
    @OperationLogger(value = "批量删除网站导航资源")
    public ResponseResult deleteBatch(@RequestBody List<Integer> ids){
        return webNavService.deleteBatch(ids);
    }


}
