/**
 * 提示弹框页面结构
 * 
 * 
 *  
 */

define(function() {
  'use strict';  
  
  return '<div class="dialog <%= klass %>">' +
         '  <div class="tips-dialog">' +
         '    <div class="header <% if(direction == "right") { %>header-rev<% } %>"></div>' +
         '    <div class="body <% if(direction == "right") { %>body-rev<% } %>"><div class="content"><%= content %></div></div>' +
         '    <div class="footer <% if(direction == "right") { %>footer-rev<% } %>"></div>' +
         '    <div class="arrow <% if(direction == "right") { %>arrow-rev<% } %>"></div>' +
         '  </div>' +
         '</div>';

});

