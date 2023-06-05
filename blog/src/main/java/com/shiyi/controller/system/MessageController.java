package com.shiyi.controller.system;


import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import com.shiyi.annotation.OperationLogger;
import com.shiyi.common.ResponseResult;
import com.shiyi.service.MessageService;
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
 * @since 2021-09-26
 */

@CrossOrigin("*")
@RestController
@RequestMapping("/system/message")
@Api(tags = "留言管理-接口")
@RequiredArgsConstructor
public class MessageController {

    private final MessageService messageService;

    @RequestMapping(value="/list",method = RequestMethod.GET)
    @SaCheckLogin
    @ApiOperation(value = "留言列表", httpMethod = "GET", response = ResponseResult.class, notes = "留言列表")
    public ResponseResult list(String name){
        return messageService.listMessage(name);
    }

    @RequestMapping(value="/passBatch",method = RequestMethod.POST)
    @SaCheckPermission("/system/message/passBatch")
    @OperationLogger(value = "批量通过")
    @ApiOperation(value = "批量通过", httpMethod = "POST", response = ResponseResult.class, notes = "批量通过")
    public ResponseResult passBatch(@RequestBody List<Integer> ids){
        return messageService.passBatch(ids);
    }


    @RequestMapping(value = "/remove",method = RequestMethod.DELETE)
    @SaCheckPermission("/system/message/remove")
    @OperationLogger(value = "删除留言")
    @ApiOperation(value = "删除留言", httpMethod = "DELETE", response = ResponseResult.class, notes = "删除留言")
    public ResponseResult deleteMessageById(int id){
        return messageService.deleteMessageById(id);
    }


    @RequestMapping(value = "/deleteBatch",method = RequestMethod.DELETE)
    @SaCheckPermission("/system/message/deleteBatch")
    @OperationLogger(value = "批量删除留言")
    @ApiOperation(value = "批量删除留言", httpMethod = "DELETE", response = ResponseResult.class, notes = "批量删除留言")
    public ResponseResult deleteBatch(@RequestBody List<Integer> ids){
        return messageService.deleteBatch(ids);
    }
}

