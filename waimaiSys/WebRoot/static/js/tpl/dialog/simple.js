define(function() {
  'use strict';  
  
  return '<div class="dialog <%= klass %>">' +
         '  <table class="simple-dialog">' +
         '    <tbody>' +
         '      <tr>' +
         '        <td class="top-right"></td>' +
         '      </tr>' +
         '      <tr>' +
         '        <td class="middle-left"></td>' +
         '        <td class="middle-center">' +
         '         <div class="dialog-main">' +
         '            <% if(hasTitle) { %>'+
         '            <div class="title">' +
         '              <a href="javascript:;" class="close fr"><i class="icon i-cross"></i></a>' +
         '              <% if(title) { %>' +
         '              <span><%= title %></span>' +
         '              <% } else { %>' +
         '              <span>ÌבÊ¾</span>' +
         '              <% } %>' +
         '            </div>' +
         '            <% } else { %>' +
         '            <a href="javascript:;" class="notitle-close fr"><i class="icon i-cross"></i></a>' +
         '            <% } %>' +
         '            <div class="content"><%= content %></div>' +
         '          </div>' +
         '        </td>' +
         '        <td class="middle-right"></td>' +
         '      </tr>' +
         '      <tr>' +
         '        <td class="bottom-left"></td>' +
         '      </tr>' +
         '    </tbody>' +
         '  </table>' +
         '</div>';

});