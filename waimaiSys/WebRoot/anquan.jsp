<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="applicable-device" content="pc">
    <title>美团外卖_外卖网_网上订餐网_美团网</title> 
    <link rel="shortcut icon" type="image/vnd.microsoft.icon" href="https://waimai.meituan.com/static/img/favicon_1.ico">
    <link rel="icon" href="https://waimai.meituan.com/static/img/favicon_1.ico" size="16x16 32x32">
      <style type="text/css">
        @font-face{font-family: "mtsi-font";src:url("//s3plus.meituan.net/v1/mss_73a511b8f91f43d0bdae92584ea6330b/font/70d86636.eot");src:url("//s3plus.meituan.net/v1/mss_73a511b8f91f43d0bdae92584ea6330b/font/70d86636.eot?#iefix") format("embedded-opentype"),url("//s3plus.meituan.net/v1/mss_73a511b8f91f43d0bdae92584ea6330b/font/70d86636.woff");}
      </style>
      <style type="text/css">
        .mtsi-num {
          font-family: 'mtsi-font' !important;
        }
      </style>
<link rel="stylesheet" href="../static/css/page/qualification.css" type="text/css"></link></head>
	<body style="">
	  <div class="triffle" id="triffle">
	  </div>
	  <div class="wrapper">
        <div class="csr-header">
            <div class="header-content">
                <a id="left" href="https://waimai.meituan.com/">
                    <div class="logo-pic"></div>
                    <div class="waimai">
                        <div class="waimai-title"></div>
                        <div class="waimai-slogan"></div>
                    </div>
                </a>
                <div id="right">
                    <ul id="links">
                        <li data-index="0"><a href="https://waimai.meituan.com/">首页</a></li>
                        <li data-index="1"><a href="https://i.waimai.meituan.com/node/csr/joinin">入驻加盟</a></li>
                        <li data-index="2"><a href="https://i.waimai.meituan.com/node/csr/openplatform">开放平台</a></li>
                        <li data-index="3"><a href="https://i.meituan.com/csrpc/index.html">社会责任</a></li>
                        <li data-index="4"><a href="https://waimai.meituan.com/new/waimaiIndex">点外卖</a></li>
                        <li data-index="5"><a href="https://waimai.meituan.com/mobile/download/default">下载手机版</a></li>
                    </ul>
                </div>
            </div>
        </div>
      <div class="page-wrap">
        <div class="inner-wrap">
<div id="announcement-area"><div> <div class="announcement-banner" style="height: auto;">        <p class="banner-word"><i class="announcement-icon"></i>美团外卖向消费者郑重承诺：            <a class="link-annocement" href="https://i.waimai.meituan.com/node/announcement/index">平台公示</a>    </p></div> <div class="divider"></div></div></div>
<div class="rest-info">
    <div class="right-bar fr clearfix ct-lightgrey">
        <div class="fl ack-ti">
            <div class="desc">起送</div>
            <div class="nu">
                <strong class="mtsi-num">${store_comment.startMoney }</strong>元
            </div>
        </div>
      <div class="fl in-ti">
          <div class="desc">配送费</div>
          <div class="nu">
              <strong class="mtsi-num">${store_comment.distributionMoney }</strong>元
          </div>
      </div>
    </div>
  <div class="details">
    <div class="up-wrap clearfix">
      <div class="avatar fl">
        <img class="scroll-loading" src="../static/images/${store_comment.storeImg}" data-src="https://p1.meituan.net/120.0/waimaipoi/9f995ce46e7f2a12533cd7a89073f77b9585.jpg" data-max-width="106" data-max-height="80" style="width: 106px; height: 79.5px;">
      </div>
      <div class="list">
        <div class="na">
          <a href="https://waimai.meituan.com/restaurant/144895314720927658">
            <span>${store_comment.storeName }</span><i class="icon i-triangle-dn"></i>
          </a>
        </div>
        <div class="stars clearfix" style="margin-top:14px;">
            <span class="star-ranking fl">
                    <span class="star-score" style="width: 70px"></span>
              </span>
            <span class="fl mark ct-middlegrey">${store_comment.commentlv }</span> <br>
        </div>
      </div>
    </div>
    <div class="rest-info-down-wrap" style="">
      <div class="clearfix sale-time">
        <p class="poi-detail-left"><svg class="icon-Combined-Shape"><use xlink:href="#icon-Combined-Shape"></use></svg><span>营业时间</span></p>
        <p class="poi-detail-right"><span class="info-detail">09:00-19:30</span></p>
      </div>
        <div class="rest-info-thirdpart poi-address">
        <p class="poi-detail-left"><svg class="icon-Shape-Copy"><use xlink:href="#icon-Shape-Copy"></use></svg><span class="poi-address-title">商家地址</span></p>
        <p class="poi-detail-right">${store_comment.storeAddress }</p>
        </div>
    </div>
  </div>
  <div class="save-up-wrapper">
    <a href="javascript:;" class="save-up j-save-up favorite" data-poiid="144895314720927658">
      <p class="ct-black">已收藏</p>
      <i class="icon i-heart-22"></i>
    </a>
    <p class="cc-lightred-new j-save-up-people"></p>
  </div>
</div>
<div class="qualification fl" data-pid="">
  <div class="tab-link">
    <div class="tab-link-inner clearfix">
      <a href="../restaurant/findAll/${store_comment.id }" class="tab-item ">菜单</a>
      <a href="../findStor/${store_comment.id }" class="tab-item ">评价</a>
        <a href="findanqian/${store_comment.id }" class="tab-item  active">食品安全档案</a>
    </div>
  </div>
  <div class="content clearfix">
        <h2 class="q-title">食品安全监督公示</h2>
        <div class="new-zizhi">
                <div class="zizhi-img">
                    <img src="./美团外卖_外卖网_网上订餐网_美团网_files/ef7bb43c85318acc97217af11f7867d717567.jpg">
                </div>
            <div class="zizhi-info">
                    <p>场所等级：
                            <span>优秀</span>
                    </p>

                    <p>管理等级：
                            <span>优秀</span>
                    </p>
                    <p>检查日期：2017-01-05</p>

                    <p>单位名称：北京观音寺大鸭梨餐饮有限公司</p>


                    <p>法定代表人（负责人）：沈立志</p>

                    <p>经营地址：北京市大兴区黄村镇观音寺小区1号楼2层</p>

                    <p>主体业态：餐饮服务经营者（大型）</p>

                    <p>经营项目：热食类食品制售；冷食类食品制售；自制饮品制售，限普通饮品；预包装食品销售，含冷藏冷冻食品***</p>

                    <p>有效期：2021-11-27</p>

                    <p>工商营业执照号：JY21115090806150</p>

            </div>
        </div>
        
        <h2 class="q-title">商家资质信息公示</h2>
        <ul class="fl">
                <li class="qualification-list fl">
                    <div class="img-wrapper">
                    <img src="./美团外卖_外卖网_网上订餐网_美团网_files/be780cd161e2bc98db21281bcf8f0305202187.jpg">
                    </div>
                </li>
        </ul>
        <ul class="fl">
                <li class="qualification-list fl">
                    <div class="img-wrapper">
                    <img src="./美团外卖_外卖网_网上订餐网_美团网_files/e5d754f8eb802fb7cdf9a184402c803f388527.jpg">
                    </div>
                </li>
        </ul>
  </div>
</div>
<div class="widgets fr">
</div>
<div class="clear"></div>
      </div>
    </div>
    <div class="csr-footer-container">
        <div class="middle-line"></div>
        <div class="csr-footer">
            <div class="footer-content">
                <div class="top">
                    <div class="left">
                        <ul class="col1">
                            <li><a target="_blank" href="https://i.waimai.meituan.com/node/csr/openplatform">开放平台</a></li>
                            <li><a target="_blank" href="https://waimai.meituan.com/story?next_step=/newhome/news/list">媒体报道</a></li>
                            <li><a target="_blank" href="https://i.waimai.meituan.com/c/agreements/index.html">资质规则</a></li>
                            <li><a target="_blank" href="https://i.waimai.meituan.com/node/csr/joinin">入驻加盟</a></li>
                        </ul>
                        <ul class="col2">
                            <li><a target="_blank" href="https://waimai.meituan.com/help/faq">常见问题</a></li>
                            <li><a target="_blank" href="https://waimai.meituan.com/help/feedback">用户反馈</a></li>
                            <li><a target="_blank" href="https://waimai.meituan.com/help/inform">诚信举报</a></li>
                            <li><a target="_blank" href="https://waimai.meituan.com/help/job">加入我们</a></li>
                        </ul>
                    </div>
                    <div class="middle">
                        <div class="cooperation">
                            <div class="title">品牌合作</div>
                            <div class="content">wpbg.marketing@meituan.com</div>
                        </div>
                        <div class="client-service">
                            <div class="title">客服 1010-9777</div>
                            <div class="content">周一至周日 9:00~23:00<br>客服不受理商务合作</div>
                        </div>
                    </div>
                    <div class="right">
                        <div class="right-title">更多商家，更多优惠</div>
                        <div class="QR-code">
                            <div class="QR-code1"></div>
                            <div class="QR-code2"></div>
                        </div>
                    </div>
                </div>
                <div class="bottom">
                    <div class="qualification-img"></div>
                    <a class="police qualification-text" href="https://zzlz.gsxt.gov.cn/businessCheck/verifKey.do?showType=p&amp;serial=11000020190617181155000003571695-SAIC_SHOW_10002020190618113213545&amp;signData=MEQCIKE43iS91r/0c+M9tsrGmifFpV/Jx8E6D0K4K7qMtEobAiBEHywkTc4tGkmCy/gdbi8CxUaltTHcCRW7cMHhZz2U1A" target="_blank">北京三快在线科技有限公司</a>
                    <span class="copyright">©️ meituan.com 京ICP证070791号 </span>
                    <div class="img"></div>
                    <span class="police">京公网安备11010502025545号</span>
                </div>
            </div>
        </div>
    </div>
</div></body></html>