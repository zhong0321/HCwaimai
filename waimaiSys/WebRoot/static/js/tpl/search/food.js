/**
 * ËÑË÷ÁÐ±í²ÍÌüÄ£°å
 */

define(function() {
  'use strict';

  return '<li>' +
         '  <a href="javascript:;" title="<%=name_unCount%>, <%=poi_name_unCount%>, £¤<%=price%>" class="food-list" data-poiid="<%=wm_poi_id%>" data-foodid="<%=id%>">' +
         '    <span class="food-name fl ct-black"><%=name%></span>' +
         '    <span class="poi-name fl ct-lightgrey"><%=poi_name%></span>' +
         '    <span class="price fr ct-lightgrey">£¤<%=price%></span>' +
         '  </a>' +
         '</li>';

});