/**
 * 根据了页面头部的referer负责跳转，区分来自搜索引擎的流量和自然的流量
 *
 * @date 2014-10-27 星期一 初始化
 */

define(['util/utils'], function (utils) {
  'use strcit';

  var referrer = document.referrer,
      url = window.location.href,
      organic;

  // 针对了不同的搜索引擎，做相应参数的设置
  var packOrganic = function (referrer) {
    var pos = referrer.lastIndexOf('?'),
        match,
        host,
        query,
        i, len, item,
        searchEngines = [
          ['baidu', 'wd'],
          ['baidu', 'word'],
          ['baidu', 'kw'],
          ['google', 'q'],
          ['soso', 'w'],
          ['bing', 'q'],
          ['sogou', 'query'],
          ['yahoo', 'p'],
          ['youdao', 'q'],
          ['vnet', 'kw'],
          ['so', 'q'],
          ['haosou', 'q']
        ];

    match = referrer.match(/(?:\/\/)([^:\/?#]*)/);
    if (pos > -1 && match) {
      host = match[1];
      if (host.indexOf('waimai.meituan.com') > -1) {
      // if (host.indexOf('meituan') > -1) {
        return null;
      }

      query = utils.urlParams(referrer);
      for (i = 0, len = searchEngines.length; i < len; ++i) {
        item = searchEngines[i];
        if (host.indexOf('.' + item[0] + '.') > -1 && query.hasOwnProperty(item[1])) {
          
          // 针对好搜增加渠道号
          var utm_source = 4204;
          if (item[0] == 'haosou') {
            utm_source = 1524; // 4205;
          }else if (item[0] == 'baidu') {
            utm_source = 1522;
          }else if (item[0] == 'sougou') {
            utm_source = 1523;
          }
          
          return {
            'utm_campaign': item[0],
            'utm_source': utm_source
          };
        }
      }
    }

    return null;
  };

  // 根据参数页面的跳转
  var redirect = function (params) {
    var queries = [],
        p;
    for (p in params) {
      if (params.hasOwnProperty(p)) {
        queries.push(encodeURIComponent(p) + '=' + encodeURIComponent(params[p]));
      }
    }
    window.location.href = url + (url.indexOf('?') === -1 ? '?' : '&') + queries.join('&');
  };
  
  if (referrer && url.indexOf('utm_source=') === -1) {
    organic = packOrganic(referrer);
    if (organic) {
      redirect(organic);
    }
  }
});