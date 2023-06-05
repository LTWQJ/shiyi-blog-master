package com.shiyi.service;

import com.shiyi.common.ResponseResult;
import com.shiyi.entity.FeedBack;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author blue
 * @since 2022-01-13
 */
public interface FeedBackService extends IService<FeedBack> {

    ResponseResult listFeedBack(Integer type);

    ResponseResult deleteBatch(List<Integer> ids);


    ResponseResult insertFeedback(FeedBack feedBack);

}
