package com.crazyMusic.listener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * 数据监听
 * @author Administrator
 *
 */
@Component
public class DataListener implements ApplicationListener<ContextRefreshedEvent>{

	@Autowired
	private InitWarpper initWarpper;
	
	
	@Override
	public void onApplicationEvent(ContextRefreshedEvent arg0) {
		if(arg0.getApplicationContext().getParent() == null) {
			initWarpper.initConf();
			initWarpper.initCache();
		}
	}
}
