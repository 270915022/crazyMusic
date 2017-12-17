package com.crazyMusic.util;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.Const;

public final class RequestUtils {

    /**
     * <B>构造方法</B><BR>
     */
    private RequestUtils() {
    }
    
    /**
     * <B>方法名称：</B>获取客户端Cookie信息<BR>
     * <B>概要说明：</B>根据指定的名称，获取客户端Cookie信息。<BR>
     * 
     * @param request 请求
     * @param name Cookie名
     * @return Cookie Cookie信息
     */
    public static Cookie getCookieByName(HttpServletRequest request, String name) {
        if (StringUtils.isBlank(name)) {
            return null;
        }
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie;
                }
            }
        }
        return null;
    }
    
    /**
     * <B>方法名称：</B>获取客户端Cookie值<BR>
     * <B>概要说明：</B>根据指定的名称，获取客户端Cookie值。<BR>
     * 
     * @param request 请求
     * @param name Cookie名
     * @return String Cookie值
     */
    public static String getCookieValue(HttpServletRequest request, String name) {
        Cookie cookie = getCookieByName(request, name);
        if (cookie == null) {
            return null;
        }
        return cookie.getValue();
    }
    
    
    /**
     * <B>方法名称：</B>获取会话属性值<BR>
     * <B>概要说明：</B><BR>
     * 
     * @param request 请求
     * @param name 属性名
     * @return String 属性值
     */
    public static String getSessionValue(HttpServletRequest request, String name) {
        Object attr = request.getSession().getAttribute(name);
        if (attr == null) {
            return null;
        }
        return (String) attr;
    }

    /**
     * <B>方法名称：</B>获取客户端信息<BR>
     * <B>概要说明：</B>根据请求获取客户端信息。<BR>
     * 
     * @param request 请求
     * @return String 客户端信息
     */
    public static String getClientInfo(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * <B>方法名称：</B>判断客户端是否为Firefox<BR>
     * <B>概要说明：</B><BR>
     * 
     * @param request 请求
     * @return boolean 是否为Firefox
     */
    public static boolean isFirefox(HttpServletRequest request) {
        String agent = request.getHeader("USER-AGENT").toUpperCase();
        return (!StringUtils.isBlank(agent) && agent.indexOf("FIREFOX") > 0);
    }

    /**
     * <B>方法名称：</B>获取上传文件<BR>
     * <B>概要说明：</B><BR>
     * 
     * @param request 请求
     * @return MultipartFile 上传文件
     */
    public static MultipartFile getUploadFile(HttpServletRequest request) {
        return getUploadFile(request, "file");
    }

    /**
     * <B>方法名称：</B>获取上传文件<BR>
     * <B>概要说明：</B><BR>
     * 
     * @param request 请求
     * @param name 文件名
     * @return MultipartFile 上传文件
     */
    public static MultipartFile getUploadFile(HttpServletRequest request, String name) {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        return multipartRequest.getFile(name);
    }

    /**
     * <B>方法名称：</B>保存上传文件<BR>
     * <B>概要说明：</B><BR>
     * 
     * @param request 请求
     * @param path 保存路径
     * @throws IOException 预想外异常错误
     */
    public static void saveUploadFile(HttpServletRequest request, String path) throws IOException {
        MultipartFile file = getUploadFile(request);
        String sep = System.getProperty("file.separator");
        File filePath = new File(path);
        if (!filePath.exists()) {
            filePath.mkdirs();
        }
        String fullPath = path + sep + file.getOriginalFilename();
        File uploadedFile = new File(fullPath);
        file.transferTo(uploadedFile);
    }
    
    /***
     * 获取 request 中 json 字符串的内容
     * 
     * @param request
     * @return : <code>byte[]</code>
     * @throws IOException
     */
    public static String getRequestJsonString(HttpServletRequest request)
            throws IOException {
        String submitMehtod = request.getMethod();
        // GET
        if (submitMehtod.equals("GET")) {
        	if(request.getQueryString() != null) {
        		return new String(request.getQueryString().getBytes("iso-8859-1"),"utf-8").replaceAll("%22", "\"");
        	}else {
        		return "";
        	}
            // POST
        } else {
            return getRequestPostStr(request);
        }
    }

    /**      
     * 描述:获取 post 请求的 byte[] 数组
     * <pre>
     * 举例：
     * </pre>
     * @param request
     * @return
     * @throws IOException      
     */
    public static byte[] getRequestPostBytes(HttpServletRequest request)
            throws IOException {
        int contentLength = request.getContentLength();
        if(contentLength<0){
            return null;
        }
        byte buffer[] = new byte[contentLength];
        for (int i = 0; i < contentLength;) {

            int readlen = request.getInputStream().read(buffer, i,
                    contentLength - i);
            if (readlen == -1) {
                break;
            }
            i += readlen;
        }
        return buffer;
    }

    /**      
     * 描述:获取 post 请求内容
     * <pre>
     * 举例：
     * </pre>
     * @param request
     * @return
     * @throws IOException      
     */
    public static String getRequestPostStr(HttpServletRequest request)
            throws IOException {
        byte buffer[] = getRequestPostBytes(request);
        String charEncoding = request.getCharacterEncoding();
        if (charEncoding == null) {
            charEncoding = "UTF-8";
        }
        return new String(buffer, charEncoding);
    }
    
    public static JSONObject getAesParams(HttpServletRequest request) throws IOException{
    	String requestJsonString = getRequestJsonString(request);
    	JSONObject jb = new JSONObject();
    	jb = JSONObject.parseObject(requestJsonString);
    	/*if(!jb.isEmpty()){
    		Set<String> keySet = jb.keySet();
    		for (String key : keySet) {
    			Object val = jb.get(key);
    			if(val != null && !"".equals(val)){
    				String valStr = SymmetricEncoder.AESDncode(Const.AESKEY, jb.get(key)+"");
    				Object o = null;
					try {
						o = isJson(valStr);
					} catch (Exception e) {
					}
    				jb.put(key, o==null?valStr:o);
    			}
			}
    	}*/
		return jb==null?new JSONObject():jb;
    }
    
    private static Object isJson(String str) throws Exception{
    	Object o = JSONObject.parseObject(str);
    	return o;
    }
    
    public static String getRemoteHost(HttpServletRequest request){
        String ip = request.getHeader("x-forwarded-for");
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
            ip = request.getHeader("Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
            ip = request.getRemoteAddr();
        }
        return ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
    }

}
