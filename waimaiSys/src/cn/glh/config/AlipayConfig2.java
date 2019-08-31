package cn.glh.config;

import java.io.FileWriter;
import java.io.IOException;

//http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/index.jsp
public class AlipayConfig2 {
    // 1.商户appid
    public static String APPID = "2016101000655773";
    //2.私钥 pkcs8格式的
    public static String RSA_PRIVATE_KEY ="MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCcM969LR/II1CWzuzzFElVgkYVdhT81pUiikEISOhYFHW0FQIuqmsURQLm+9S/kTND469DuAQQ2yXPDP0mqoA/EkhDQBpWRkJsnV+4Zp8NDcYOywWZc8LmvlyUtVuFs1uSlouMDuCbJY8t84HsaDOUsw24h6dh8dgmC/ziROGiSsvG6Eea289swGlbR6oAcu59bF8cjInWweX1o+qS3WueWiAOkWaaSpjeEpzviYWu+eFCsDmVknwS4c+ouX0UXVbKhXs33iJf3luKIn1LRtYDPwBsgTOC14/X+xNJe8w/oRQ7qmoyQdzTBpEjXy14+OaGkgwwd4338LrvrputXPbJAgMBAAECggEAVvYxvVRP61Zt2WfeVv4mTaq3Zd9Vk+XLJW2fAwPEBrVtShKgImbSMnixQvNU4EnwJo2t15+s881t4TW0AkDOIU8GWBpqDzoSZPHAhqLrTZMrfrTcqy/dhCTa2heVmnveMWAK1LC7ruRcMBLvdDQW82Qz8VXkhAzmb1ghM79xdq4a1/l5ieJ6hskgQT26qacLXUnq2K9Co2iiSO6QkzRljPm1by/AI4EmIYft/V0zacLon1yGd2n7Wzv/CGKo9jFSBMBFV4pBV8XC/xK5R/tyDpSTwQr/oZuptfPjBC1ukiz00OQzLZqmKNICnr6REEuJvIFrudGmVdM1SjZeRngAmQKBgQDIe0GCdqm7rOM1pKhOQVBIZSYznzwzfRUZI28hfg4hU+Pppalih8+v1KbwGBkTDrcxZkIRT0MBW+0hWbVHIW+Hd+dsrdTa1ldn5hJVlmOkdNCnGRAJbVvW93dyxiCyjx9RYqTUythTcedjpwadKjOR0NRq3va4Z0lgJNgPRLue6wKBgQDHdY0UWM3sHK3nfBeFkZKt7DrxVVybURP4om7CIv1z5wfbGzLQu0HiNkwI3AUFeOkK+VgDyjOQEGQnyapD5DwRthgAQVI6y5XyhsO+f3WnRvUo1NGpv/j0mmxallpkubrPuxxfUq/idpOjv6q6GvUj7oJeO6UCeUAQyZsIMzScGwKBgCG0Zx0R6hM9S62XExyk6mRhbPy8xpg5bTSeum49DQ8ZVXXQfhusjYQYEkDHLGAB11acxHq4gqFV3RYASPO+cUurIuMojmKEKomzKl3tPK9HXFTbZ9DN6+TGEfTfzlt2qGM8XE3SFHBi8+3TBM+jaqwXGb8l4QC7jKB3UUOv4IMlAoGARFjSjAtWHLdDHBRYlwtoALL3C6Vdg1dICaXXYCzPPr0G4xyxz/aqv9ItQcfq7JIfAQSqFTpfatlDCKNA9dyqfMMx/Dxl6gHDEwT85DUW4sgcz+4FHi7LJz4XLP9iYCuIiRAry7owzOAm/TB7VyRPpg1fnNzBUVStEFOVDT1GpMsCgYEAnJ0Wsu1KezpbTRpw3oXdsKDYJzyO0z31AVu8Crrl9s99galNcnA0j6J/X++6znfwGO+J5DGZvzJ4945BM2GDZ18FVUSgEdUS9qGpBVwV+SixL4oyayjXbXnZ0WGH3ADs7RwergD2Aq1ht1ZEpvRqFDiuiLt2vGPZVOOCg6Y+b2k=";
    // 3.支付宝公钥
    public static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsIZuZRsOGRnWy1FgxCLNKk2iawzsCZXtCpHSWp4rm5mmAxCODziRABhXrDSofnQQ9/CVG4Fi7e7ysyYSFfGyq9Hxm6LnBiygOLf9v34Bu8tFi4Zj4RQO1il6+sVLq1+p51CY9XaTCQ2iKZoGy4fqQev4kXiyP5/OQuXz9UYgKaMJlxF33CJWNDzPHyQ2PWl83OJ86gMC6khSBRKN/UqLMyPHx66Z8dLlyZAhOxs8cyPS/xqleJTdVcULPRAO/xLVjhZ8jRi8Fa9qFC8TBTE+N2psqagmJk2SC5NGH9mMSWPpvWj2Bti1vwP7/d6RrxVoDna68W7PMpMYbQzN0xgLgwIDAQAB";
    // 4.服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/waimaiSys/notify";
     //5.页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址
    public static String return_url = "http://localhost:8080/waimaiSys/return";
    // 6.请求支付宝的网关地址
    public static String URL = "https://openapi.alipaydev.com/gateway.do";
    // 7.编码
    public static String CHARSET = "UTF-8";
    // 8.返回格式
    public static String FORMAT = "json";
    // 9.加密类型
    public static String SIGNTYPE = "RSA2";
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	// 支付宝网关
	public static String log_path = "C:\\";
    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}