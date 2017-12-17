package com.crazyMusic.common.listener;
import javax.servlet.ServletContextEvent;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.ContextLoaderListener;

import com.crazyMusic.web.mall.MallController;
public class InitListener extends ContextLoaderListener{
	
	private static Logger logger = LoggerFactory.getLogger(MallController.class);
	
	@Override
	public void contextInitialized(ServletContextEvent event) {
		
	}
}
