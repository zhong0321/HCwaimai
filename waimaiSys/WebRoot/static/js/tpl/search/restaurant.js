/**
 * �����б����ģ��
 */

define(function() {
  'use strict';

  return '<li>' +
         '  <a href="javascript:;" title="<%=name_unCount%>" class="rest-list" data-poiid="<%=id%>">' +
         '    <img src="<%=pic_url%>" />' +
         '    <span class="name fl"><%=name%></span>' +
         '    <% if (avg_delivery_time != 0) {%><span class="send-time ct-lightgrey fr"><%=avg_delivery_time%>����</span> <%}%>' +
         '  </a>' +
         '</li>';
});
