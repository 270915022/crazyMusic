package com.crazyMusic.oss;

import java.io.InputStream;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.PutObjectResult;
import com.crazyMusic.constant.Const;

/**
 * 阿里云oss操作
 * @author Administrator
 *
 */
public class OSSClientUtil {
	
	private static OSSClient instance;
    private OSSClientUtil (){
    }   
    public static OSSClient getInstance(){    //对获取实例的方法进行同步
      if (instance == null){
          synchronized(OSSClientUtil.class){
              if (instance == null)
                  instance = new OSSClient(Const.ENDPOINT,Const.ACCESSKEYID,Const.ACCESSKEYSECRT); 
          }
      }
      return instance;
    }
    
    /**
     * 上传流
     * @param key
     * @param ins
     * @throws Exception
     */
    public static void uploadByStream(String key,InputStream ins) throws Exception {
    	if(ins == null)
    		throw new Exception("输入流不能为空！");
    	instance.putObject(Const.BUCKETNAME, key, ins);
    }
    
}
