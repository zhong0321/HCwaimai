/**
 * ���̨����Ľӿ��б�
 *
 * @date 2014.01.06
 */

define(function() {
  'use strict';

  var passportDomain = (window.MT && MT.ENV=='test') ? 'passport.test.meituan.com' : 'passport.meituan.com';
  var locationOrigin = location.protocol+'//'+location.host;
  return {
    'locationOrigin' : locationOrigin, //ģ��webkit������е�location.origin

    // ---------- �˻�������� ------------ start
    // �ǳ�
    'getLogout' : '/login/out',

    // ��¼
    'getLogin' : '/login',
    
    // ��ȡ�ֻ���֤��
    'getMobileVerify' : '/account/bind/captcha',
    
    // ���ֻ���
    'bindMobile' : '/account/bind/verifycaptcha',

    // �޸��û���
    'reName' : '/account/ajax/resetaccount',
    
    // �޸�����ӿ�
    'changePassword' : '/account/ajax/resetaccount',
    
    // ��֤�û��Ƿ��¼
    'verifyLogin' : '/account/islogin',
    
    // ��֤�ֻ��ŵĵ�¼
    'verifyPhone' : '/account/isbindphone',

    // ��õ�¼url
    'loginUrl' : '//'+passportDomain+'/account/unitivelogin?service=waimai&continue='+encodeURIComponent(locationOrigin+'/account/settoken'),

    // ���ע��url
    'registerUrl' : '//'+passportDomain+'/account/unitivesignup?service=waimai&continue='+encodeURIComponent(locationOrigin+'/account/settoken'),

    // ��õ�¼url
    'logoutUrl' : '//'+passportDomain+'/account/unitivelogout?service=waimai&continue='+encodeURIComponent(locationOrigin+'/account/logout'),

    // ��¼�����js
    'loginDlgJs' : '//'+passportDomain+'/account/fetchunitiveloginscript',
    
    // ---------- �˻�������� ------------ end

    // ȫ������ ajax�ӿ�
    'searchAll' : '/search/ajax/rtofd',

    // �ղص��� ajax�ӿ�
    'favoriteRest' : '/ajax/favorite/restaurant',
    // ȡ���ղص��� ajax�ӿ�
    'unfavoriteRest' : '/ajax/favorite/restaurant_del',

    // ���� ��Ʒ��� ����ť���ajax�ӿ�
    'searchFoodBuy' : '/search/log/logClickFoodBuy',

    // �µ������л�ȡ�ֻ���֤��ӿ�
    'getSMSCode' : '/ajax/order/getsmscode',

    // ��ȡ�齱����
    'getLottery' : '/lottery/ajax/participate',

    // ���ͷ�����Ϣ
    // ����¼��
    'sendFeedbackL' : '/help/feedback',
    // ��δ��¼��
    'sendFeedback' : '/help/nologin/feedback',

    // �������
    'getCooperate': '/help/ajax/cooperate',

    // �������
    'getBanmaCooperate': '/help/ajax/banma',

    //�����̼���
    'postAgentJoin': '/help/ajax/agent',

    // ��ȡλ����Ϣ
    'getDistrict' : '/point',
    
    // ��������͵�ǰ�����ڵĳ�����Ϣ
    'sendEmail' : '/city/wish',   
    
    // �ύ�����ӿ�
    'submitOrder' : '/order/submit',
    
    // ҳ����־�����ַ
    'setLog' : '/help/ajax/__.gif',
      
    // ������ַ�ӿڣ������˶Ե�ַ����ɾ�Ĳ�Ȳ�����
    'editAddress' : '/customer/hisaddr/ajax/edit',
    
    // ʳƷ���۽ӿ�
    'commentFood' : '/comment/food',
    
    // ��ȡĳ���ŵ������������Ϣ
    'getComments' : '/ajax/comment',
    
    // ����ĳһ�ζ�����������Ϣ
    'commentOrder' : '/comment',
    
    // ȷ��������Ϣ
    'orderConfirm' : '/order/confirm',
    
    // �Ƿ�����׵�����
    // 'isFirstReduce' : '/node/order/act/canFst',
    'isFirstReduce' : '/ajax/order/getFstOrderActInfo',
    
    // ��ȡ��ǰ�ֻ��ŶԶ�Ӧ���Ż�ȯ
    'getCurrentTickets' : '/ajax/order/getUserCouponList',
    
    // ʹ�õּ�ȯ
    'useCoupon': '/order/act/usecoupon',
    
    // ���¹��ﳵ����Ϣ
    'updateCart': '/ajax/order/preview',
    
    // ��ȡ������ǰ��״̬�Ľӿ�
    'getOrderStatus' : '/ajax/order/getstatus',
    
    // ȡ�������Ľӿ�
    'cancelOrder' : '/ajax/order/cancel',
    
    // �Զ���ʾ���İ�
    'buildSuggest' : '/build/suggest/wmpoi',
    
    // ��ȡ�ֻ���̬�루���ֻ���¼�Ĺ����У�
    'getPhoneCode' : '/login_d/captcha',

    // ���;ٱ�
    'sendInform' : '/help/ajax/report/cheatingpoi',
    
    // ��ȡ�ֻ���̬�루���ֻ�ע��Ĺ����У�
    'getRegisterCode' : '/register/captcha',
    
    // �ֻ���̬���¼
    'phoneCodeLogin' : '/login_d',
    
    // �û���ע��
    'userRegister' : '/register',

    // ���֧��״̬
    'getPayStatus' : '/ajax/order/getpaystatus',

    //ȥ֧��
    'pay' : '/order/pay',

    //֧��������֤��
    'paySendSms' : '/order/pay/resendsmscode',
    
    // ��ȡ��ǰ������Ϣ
    'getCityInfo' : '/ajax/city/entrance_info/city_id',
    
    // ������ĳ������㣬��ȡ��ǰ����ķ�����Ϣ��������ȡ���ѵ���Ϣ��
    'getRestInfo' : '/ajax/location/info',
    
    'getBatchRestInfo' : '/ajax/location/batch/count/restaurant',

    // ����������֤�Ĺ���
    'voiceVerify' : '/ajax/order/getcallcode',
    
    // ɾ��ĳ����Ʊ����Ϣ
    'deleteCheque' : '/ajax/invoice/del',

    // ���������ӿڣ����������֧����ť�������¼���
    'fullMinusUpgrade' : '/order/act/addition/onlinepay',

    //��������
    'readTip' : '/help/tip/del',

    'getTip' : '/help/tip/get',
    
    'chargeDiscountPlus' : '/order/act/fstordersp/addition/onlinepay',
    
    // �ײ�����֧�����Ż�
    'packageOnline' : '/order/act/addition/onlinespecial',

    // �û������˿������
    'refundAppeal' : '/order/refund/appeal/submit',

    // ȡ���˿�
    'cancelRefund' : '/order/refund/apply/cancel/submit',

    //�����˿����ҳ, ��鶩���Ƿ��ʤ����
    'applyRefund' : "/order/refund/apply/validate",

    // ȡ���˿�����
    'cancelAppeal' : '/order/refund/appeal/cancel/submit',

    // ��־��ͳһ�ӿ�
    'logger' : '/log',

    // �ڹ������ҳ��������������ͳ�� /ajax/poiByOrder/{poiId}
    'homeOrderedLog' : '/ajax/poiByOrder'
  };
});









