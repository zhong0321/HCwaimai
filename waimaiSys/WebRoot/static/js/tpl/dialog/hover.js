define(function() {
  'use strict';  
  
  return '<div class="dialog <%= klass %>">' +
         '  <div class="hover-dialog">' +
         '    <i class="i-triangle-up"></i>' +
         '    <span class="content"><%= content %></span>' +
         '  </div>' +
         '</div>';

});