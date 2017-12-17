package test;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSONObject;
import com.crazyMusic.constant.Const;
import com.crazyMusic.util.SymmetricEncoder;

public class HttpTest {
	public static String httpPostWithJSON(String url) throws Exception {

        HttpPost httpPost = new HttpPost(url);
        CloseableHttpClient client = HttpClients.createDefault();
        String respContent = null;
        
//        json方式
        JSONObject jsonParam = new JSONObject();  
        jsonParam.put("name", SymmetricEncoder.AESEncode("crazyMusic", "admin"));
        jsonParam.put("pass", SymmetricEncoder.AESEncode("crazyMusic", "123456"));
        JSONObject dataJson = new JSONObject();
        dataJson.put("age", "123");
        jsonParam.put("data", SymmetricEncoder.AESEncode("crazyMusic", dataJson.toJSONString()));
        StringEntity entity = new StringEntity(jsonParam.toString(),"utf-8");//解决中文乱码问题    
        entity.setContentEncoding("UTF-8");    
        entity.setContentType("application/json");    
        httpPost.setEntity(entity);
        System.out.println();
        
    
//        表单方式
//        List<BasicNameValuePair> pairList = new ArrayList<BasicNameValuePair>(); 
//        pairList.add(new BasicNameValuePair("name", "admin"));
//        pairList.add(new BasicNameValuePair("pass", "123456"));
//        httpPost.setEntity(new UrlEncodedFormEntity(pairList, "utf-8"));   
        
        
        HttpResponse resp = client.execute(httpPost);
        if(resp.getStatusLine().getStatusCode() == 200) {
            HttpEntity he = resp.getEntity();
            respContent = EntityUtils.toString(he,"UTF-8");
        }
        return respContent;
    }

    
    public static void main(String[] args) throws Exception {
        String result = httpPostWithJSON("http://localhost:8080/crazyMusic_web/user/testDemo");
        System.out.println(result);
    }
}
