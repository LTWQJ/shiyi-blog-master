package com.shiyi.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shiyi.common.FieldConstants;
import com.shiyi.common.ResponseResult;
import com.shiyi.entity.Tags;
import com.shiyi.entity.WebNavigation;
import com.shiyi.mapper.WebNavMapper;
import com.shiyi.service.WebNavService;
import com.shiyi.util.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import java.util.List;
import static com.shiyi.common.FieldConstants.LIMIT_ONE;

/**
 * @Title
 * @Description 为网站资源导航的service接口写实现类
 * @Param
 * @return
 * @Author LTW
 * @Date 2023/5/18
*/

@Service
public class WebNavServiceImpl extends ServiceImpl<WebNavMapper, WebNavigation> implements WebNavService {
    @Autowired
    public WebNavMapper webNavMapper;
    @Override
    public ResponseResult listwebnav(String title) {
        Page<WebNavigation> list = baseMapper.selectPageRecord(new Page<>(PageUtils.getPageNo(), PageUtils.getPageSize()),title);
        return ResponseResult.success(list);
    }

    @Override
    public ResponseResult insertwebnva(WebNavigation webNavigation) {
        baseMapper.insert(webNavigation);
        return ResponseResult.success();
    }

    public ResponseResult updatewebnav (WebNavigation webNavigation){
            baseMapper.updateById(webNavigation);
            return ResponseResult.success();
        }

        @Override
        public ResponseResult deleteById (Integer id){
            baseMapper.deleteById(id);
            return ResponseResult.success();
        }

        @Override
        public ResponseResult deleteBatch (List < Integer > ids) {
            baseMapper.deleteBatchIds(ids);
            return ResponseResult.success();
        }

    public ResponseResult getwebnavById (Integer id){
            WebNavigation webNavigation = baseMapper.selectById(id);
            return ResponseResult.success(webNavigation);
        }

        /**
         *  admin分页获取所有网站导航资源
         * @return
         */
    }

