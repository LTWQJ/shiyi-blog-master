package com.shiyi.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.shiyi.common.ResponseResult;
import com.shiyi.entity.Tags;
import com.shiyi.entity.WebNavigation;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/*
 * @Title
 * @Description 网站资源导航的service接口
 * @Param
 * @return
 * @Author LTW
 * @Date 2023/5/18
*/
@Service
public interface WebNavService extends IService<WebNavigation> {
    ResponseResult listwebnav(String name);

    ResponseResult insertwebnva(WebNavigation webNavigation);

    ResponseResult updatewebnav(WebNavigation webNavigation);

    ResponseResult deleteById(Integer id);

    ResponseResult deleteBatch(List<Integer> ids);

    ResponseResult getwebnavById(Integer id);


}