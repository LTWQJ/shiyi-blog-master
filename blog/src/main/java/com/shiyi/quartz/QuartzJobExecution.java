package com.shiyi.quartz;

import com.shiyi.entity.Job;
import org.quartz.JobExecutionContext;

/**
 * @author blue
 * @date 2021/12/8
 * @apiNote 定时任务处理（允许并发执行）
 */
public class QuartzJobExecution extends AbstractQuartzJob {
    @Override
    protected void doExecute(JobExecutionContext context, Job job) throws Exception {
        JobInvokeUtil.invokeMethod(job);
    }
}
