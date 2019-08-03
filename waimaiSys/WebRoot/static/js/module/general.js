/**
 * ҳ���ϵ�ͨ�ù���ģ�顣
 *
 * @date 2014.01.26
 */

define(['lib/jquery', 'lib/raven', 'lib/jquery/cookie', 'lib/jquery/easing', 'lib/json2', 'module/user', 'module/interface', 'module/recruit', 'module/bridge', 'util/request', 'util/utils', 'module/toptips', 'module/utmredirect', 'module/search', 'module/detectzoom'], function ($, Raven, cookie, easing, json2, user, i, job, bridge, request, utils, toptips, utmredirect, search, detectzoom) {
  'use strict';

  var jQdocument = $(document), jQsendFeedback = $('#top-nav-send-fb'), jQasideFeedback = $('#aside-feedback'), jQchange = $('#changePosition'), jQislogin = $('#is-login'), jQbody = $('body'), jQmiddlewrap = $('.middlenav-wrap');

  //�޸�ҳ������Ҫ����ĵ�ַ
  (function(){
    request.get('/contact/openstore',function(res){
      if(res.code == 0){
        $(".kaidian_address").attr('href', res.data);
      }else{
        $(".kaidian_address").attr('href', '//kd.meituan.com');
      }
    });
  })();

  var addUserToolsEvent = function() {
      // �û���¼ģ��JS
      var username = $('#user-tools-username');
      var userTools = $('#new-user-tools');
      var timer = null;

      userTools.hover(function() {
          clearTimeout(timer);
      }, function() {
          userTools.css({ display: 'none' });
      });

      username.hover(function() {
          userTools.css({ display: 'block' });
      }, function() {
          timer = setTimeout(function() {
            userTools.css({ display: 'none' });
          }, 200);
      });
  };

  addUserToolsEvent();

  //����ҳ��ͷ��������
  if (jQmiddlewrap.size()) {
    search(jQmiddlewrap);
  }
  // ���õ�ǰ�û���Ϣ
  if (MT.isLogin) {
    user.setUser(true);
  }

  // ����ҳ���ϵ��������ͼ����¼�
  var keyboardEvt = function(evt) {
    if (evt.which == 27) {
      bridge.trigger('dialog:close', {});
    }
    if (evt.which == 48 && (evt.metaKey || evt.ctrlKey)) {
      hideIgnoreInfo();
    }
  };

  var mouseEvt = function(evt) {
    bridge.trigger('tags:close', evt);
    
    // �����ڵ�ͼҳ�����ص���ĸ��ֹ���
    bridge.trigger('dialog:close-city', evt);
    bridge.trigger('dialog:close-history', evt);
  };

  // ҳ��ͷ�������ĵ�¼��ע�Ṧ��
  var continueStr = null;
  var currPage = location.href;
  if (currPage.indexOf('http://') == 0) { //һ���İ�ȫ�ԵĿ���
    continueStr = '?continue=' + encodeURIComponent(currPage);
  }

  var jQloginBar = $('#dis-login');
  if (continueStr) {
    jQloginBar.find('.j-login,.j-register').add('#logout').each(function() {
      //�ж������¼����continue�ˣ����ޱ仯�����û�У������continue=��ǰҳ
      var continueUrl = null;
      var setTokenUrl = utils.urlParams(this.href)['continue'];
      if (setTokenUrl) {
        setTokenUrl = decodeURIComponent(setTokenUrl);
        continueUrl = utils.urlParams(setTokenUrl)['continue'];
      }
      if (!continueUrl) {
        this.href = this.href+encodeURIComponent(continueStr);
      }
    });
  }

  // ������ģ�鴥���˵�¼�¼���ʱ�򴥷��ĵ�¼����
  bridge.register('user:login', function(userName) {
      user.setUser(true);

      var pageName = 'home';

      // ֻ����homeҳ
      if (pageName == 'home') {
          jQloginBar.replaceWith('<a id="user-tools-username" class="new-username-home fr">' + userName + '</a>' +
                                 '<a class="new-list-btn fr" href="/customer/order/list">�ҵĶ���</a>' +
                                 '<ul class="new-tools" id="new-user-tools">' +
                                 '<li class="divide-line"><a href="/favorite/restaurant">�ҵ��ղ�</a></li>' +
                                 '<li><a href="' + (continueStr? i.logoutUrl+encodeURIComponent(continueStr) : i.logoutUrl) + '">�˳�</a></li>' +
                                 '</ul>'
          );
      } else if (pageName == 'map') {
          jQloginBar.replaceWith('<a id="user-tools-username" class="new-username-map fr">' + userName + '</a>' +
                                 '<a class="new-list-btn fr" href="/customer/order/list">�ҵĶ���</a>' +
                                 '<ul class="new-tools" id="new-user-tools">' +
                                 '<li class="divide-line"><a href="/favorite/restaurant">�ҵ��ղ�</a></li>' +
                                 '<li><a href="' + (continueStr? i.logoutUrl+encodeURIComponent(continueStr) : i.logoutUrl) + '">�˳�</a></li>' +
                                 '</ul>'
          );
      }

      addUserToolsEvent();
  });
  
  // �ع���־ͳ�Ƽ�¼��ֻ���̼�ҳ������ͳ��   
  var href = window.location.href;  
  if (href.indexOf('\/home\/') != -1) {
    bridge.register('log:home', function(els) {
      var params = [];
      for (var j = 0; j < els.length; j++) {
        params.push({
          id : els[j].data('rid'),
          pos : els[j].data('index')
        })
      }

      // TODO ��־�ع�ӿ�
      var requests = {
        params : params,
        url : location.href
      }
      request.post(i.logger, {
        key : 'homeexposure',
        value : JSON.stringify(requests)
      });
    });
  }

  //ͷ�������߼�
  toptips.init();
  
  // ���ʹ���Google analysis����־
  var sendfeedback = function() {
    ga('send', 'event', 'button', 'click', '�ҿͷ�');  //���ͳ��
    utils.delayGo(this.href);
    return false;
  };
  
  var asidefeedback = function() {
    ga('send', 'event', 'button', 'click', '�������');  //���ͳ��
  };
  
  // ���������Ƴ���ʷ��ַ��ťʱ������
  var plusHover = function() {
    $(this).addClass('hover');
  };
  
  var removeHover = function() {
    $(this).removeClass('hover');
  };

  // ��Ƹ��Ϣ�Ĵ�ӡ
  job.print();
  
  // Ravenǰ�˴�����־�ļ��
  Raven.config('//c423d173e8b04c0ab92b8a31ef28c96b@sentry.sankuai.com/56', {
     whitelistUrls: [MT.STATIC_ROOT]
  }).install();
  
  var bindEvt = function() {
    jQdocument.keydown(keyboardEvt).click(mouseEvt);
    jQchange.mouseenter(plusHover).mouseleave(removeHover);
    jQislogin.mouseenter(plusHover).mouseleave(removeHover);
    
    jQsendFeedback.click(sendfeedback);
    jQasideFeedback.click(asidefeedback);
  };
  bindEvt();
  

  // ���ҳ���Ƿ�����
  var hideIgnoreInfo = function(evt) {
    if (!jQignore) {
      return;
    }
    
    jQignore.remove();
    evt && $.cookie('ignore_zoom', 1);
  };
  
  if ($.cookie('ignore_zoom') != 1) {
    var zoom = 1;
    try {
      zoom = detectzoom.zoom();
    } catch (e) {
      ;
    }
    if (utils.approximate(zoom, 1) != 1) {
      
      // ����˲�ͬ��ƽ̨��ʾ��ͬ�İ�����Mac��PC�� 
      var targetKey = ($.inArray(navigator.platform, ['Mac68K', 'MacPPC', 'Macintosh', 'MacIntel']) != -1) ? 'Command' : 'Ctrl';
      var jQignore = $('<div class="zoom-detect" id="zoom-detect"><span class="content">�������ʵ���ҳ���ݱ����ſ���Ӱ������ʹ�ã�����ʹ�ü��̿�ݼ�' + targetKey + ' + 0 �ָ�����</span><a class="ignore" href="javascript:;">��������</a></div>');
      jQbody.append(jQignore);
      jQignore.delegate('.ignore', 'click', hideIgnoreInfo);
    }
  }
});
