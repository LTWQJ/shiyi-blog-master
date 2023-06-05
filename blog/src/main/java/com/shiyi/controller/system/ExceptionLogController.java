package com.shiyi.controller.system;


import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import com.shiyi.annotation.OperationLogger;
import com.shiyi.common.ResponseResult;
import com.shiyi.service.ExceptionLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author blue
 * @since 2021-11-11
 */
@CrossOrigin("*")
@RestController
@RequestMapping("/system/exceptionLog")
@RequiredArgsConstructor
@Api(tags = "异常日志管理")
public class ExceptionLogController {

    private final ExceptionLogService exceptionLogService;

    @GetMapping(value = "/list")
    @SaCheckLogin
    @ApiOperation(value = "异常日志列表", httpMethod = "GET", response = ResponseResult.class, notes = "异常日志列表")
    public ResponseResult list() {
        return exceptionLogService.listExceptionLog();
    }

    @DeleteMapping(value = "/delete")
    @SaCheckPermission("/system/exceptionLog/delete")
    @OperationLogger(value = "删除异常日志")
    @ApiOperation(value = "删除异常日志", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除异常日志")
    public ResponseResult deleteBatch(@RequestBody List<Long> ids) {
        return exceptionLogService.deleteBatch(ids);
    }
}

