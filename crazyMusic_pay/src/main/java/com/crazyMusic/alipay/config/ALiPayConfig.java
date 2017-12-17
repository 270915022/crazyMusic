package com.crazyMusic.alipay.config;

/**
 * 支付宝支付所需的必要参数
 * 理想情况下只需配置此处
 */
public class ALiPayConfig {
    // 合作身份者ID，以2088开头由16位纯数字组成的字符串
    public static String partner = "2088XXXXX";
    
    //appid
    public static String appid = "2017XXXXXXXXXX44";
    
    //商户支付宝账号
    public static String seller_email= "@qq.com";
    
    //商户真实姓名
    public static String account_name = "科技有限公司";
    
    // 商户的私钥RSA
    public static String private_key = "";
    
    //支付宝的公钥  RSA
    public static String ali_public_key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB";
    
    //签名方式 (支付回调签名方式)
    public static String pay_sign_type = "RSA";
    
    /**
     * 支付宝服务器主动通知商户服务器里指定的页面http/https路径。建议商户使用https
     * 这里需要测试的话，需要用外网测试。https://www.ngrok.cc/   这里有免费和付费的，实际上，免费用一下就可以了。
     */
    public static String notify_url = "http://你的域名/你的项目名/ALiPay/AfterPayNotify";
    
    //商品的标题/交易标题/订单标题/订单关键字等。
    public static String subject = "deemo---歌曲购买";
    
    //↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
    
    //接口名称		固定为：alipay.trade.app.pay
    public static String method = "alipay.trade.app.pay";
  
    //调用的接口版本，固定为：1.0
    public static String version = "1.0";
    
    //销售产品码，商家和支付宝签约的产品码，为固定值QUICK_MSECURITY_PAY
    public static String product_code = "QUICK_MSECURITY_PAY";

    // 字符编码格式 目前支持 gbk 或 utf-8
    public static String input_charset = "utf-8";

}
