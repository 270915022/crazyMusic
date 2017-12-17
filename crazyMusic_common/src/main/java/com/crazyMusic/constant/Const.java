package com.crazyMusic.constant;

import java.math.BigDecimal;

public final class Const {

    /**
     * <B>构造方法</B><BR>
     */
    private Const() {
    }

    /** 通用字符集编码 */
    public static final String CHARSET_UTF8 = "UTF-8";

    /** 中文字符集编码 */
    public static final String CHARSET_CHINESE = "GBK";

    /** 英文字符集编码 */
    public static final String CHARSET_LATIN = "ISO-8859-1";
    
    /** 日期格式 */
    public static final String FORMAT_DATE = "yyyy-MM-dd";

    /** 日期时间格式 */
    public static final String FORMAT_DATETIME = "yyyy-MM-dd HH:mm:ss";

    /** 时间戳格式 */
    public static final String FORMAT_TIMESTAMP = "yyyy-MM-dd HH:mm:ss.SSS";
    
    public static String USER_SIGN_DEFAULT = "这个人很懒，什么都没留下。";
    
    public static String DEFAULT_HEAD_IMG_BOY = "";//男生OSS头像地址
    
    public static String DEFAULT_HEAD_IMG_GIRL = "";//女生OSS头像地址
    
    //注册验证码超时时间 s 为单位
    public static int codeExpireTime = 60*3; 
    
    public static final String SYS_INIT = "SYS_INIT";
    
    public static final String TOKEN = "token";
    
    public static String AESKEY = "";
    
   //###########短信配置常量开始#########################
    public static String sign = "";//签名
    
    public static String tempCode = "";//模板code
    
  //###########短信配置常量结束#########################
    
    /**
     * 返回结果code约定
     */
    public static final int SUCCESS_CODE = 0;//成功
    
    public static final int FAIL_CODE = -1;//失败
    
    public static final int NOTLOGIN = -2;//未登录
    
    public static final String SUCCESS_MSG = "成功";
    
    public static final String FAIL_MSG = "失败";
    
    //#########微信配置开始#####################
    
    public static String APPID;
    
    public static String SECRET;
    
    public static String GRANT_TYPE = "authorization_code";
    
    //#########微信配置结束#####################
    
    
    //#########用户登陆状态开始#####################
    
    //未注册
    public static String NOTREGIST = "NOTREGIST";
    
    //已冻结
    public static String FREEZE = "FREEZE";
    
    //用户名或密码错误
    public static String WRONGPASSWORD = "WRONGPASSWORD";
    
    //#########用户登陆状态结束#####################
    
    
    //#########系统错误提示信息#####################
    
    public static String SYSTEM_BUSY = "系统繁忙，请稍后再试！";
    
    public static String PARAM_ERROR = "参数传入不正确";
    
    //#########系统错误提示信息#####################
    
    //#########阿里云oss配置开始#####################
    public static String ENDPOINT;
    
    public static String ACCESSKEYID;
    
    public static String ACCESSKEYSECRT;
    
    public static String BUCKETNAME;
    
    //#########阿里云oss配置结束#####################
    
    
    /**
     * 商城配置
     */
    //购物车失效时间 分钟
    public static int CARD_EXPIRE_TIMEOUT = 1000;
    
    //物流名称
    public static String LOGISTICAL_NAME = "";
    
    //邮费
    public static BigDecimal POST_FEE;
    
    //订单状态
    public static int ORDER_STATE_NOTPAY = 1;//未付款
    public static int ORDER_STATE_PAY = 2;//已付款
    public static int ORDER_STATE_NOTSEND = 3;//未发货
    public static int ORDER_STATE_SEND = 4;//已发货
    public static int ORDER_STATE_CLOSE = 5;//交易关闭
    public static int ORDER_STATE_COMPLETE = 6;//交易完成
    public static int ORDER_STATE_REFUNDING = 7;//退款中
    public static int ORDER_STATE_COMREFUND = 8;//退款完成
    public static int ORDER_STATE_REFUSEREFUND = 9;//拒绝退款
    
    
    
    
}
