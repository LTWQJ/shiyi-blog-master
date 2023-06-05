package com.shiyi.mapper;

import com.shiyi.entity.JobLog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 定时任务调度日志表 Mapper 接口
 * </p>
 *
 * @author blue
 * @since 2021-12-08
 */
@Repository
public interface JobLogMapper extends BaseMapper<JobLog> {

    void clean();

}
