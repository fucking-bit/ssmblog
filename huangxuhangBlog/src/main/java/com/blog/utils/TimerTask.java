package com.blog.utils;

import com.blog.service.SerachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class TimerTask {
    @Autowired
    SerachService serachService;

    /**
     *
     */
    //  每天凌晨1点
    @Scheduled(cron = "0 0 1 * * ?")
    public void test1() throws IOException {
        serachService.testCreate();
        System.out.println("开始执行索引更新");
    }

}
