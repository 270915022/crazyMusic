package com.crazyMusic.main;

import java.io.IOException;

public class User_Main {
	public static void main(String[] args) throws IOException {
		com.alibaba.dubbo.container.Main.main(args);
		//System.in.read(); // 为保证服务一直开着，利用输入流的阻塞来模拟
	}
}
