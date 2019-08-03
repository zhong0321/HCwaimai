/**
 * 页面吸顶搜索条
 * 即header
 *
 * @author yuzhengfeng@meituan.com
 * @date 2018-08-22 星期二
 */

define(['lib/jquery', 'tpl/ceiling', 'module/search'], function($, tpl, search) {
  'use strict';

    var currentPage = '';
    var page = 0;

    // 进入该页面时, 为当前页面增加active, bottom-border以及font-weight
    var addActive = function() {
        var activeNode = $('#links').children('li')[page].firstChild;
        activeNode.classList.add('active');
    };

    var addActiveLine = function() {
        var activeNode = $('#links').children('li')[page].firstChild;
        $(activeNode).css({ 'border-bottom': '3px solid #FFBD27' });
    };


    // 当鼠标移动到其他的nav时，则移除当前页面的active, bottom-border
    var removeActiveLine = function() {
        var target = event.target;
        var node = $('#links').children('li')[page].firstChild;

        if(target != node) {
            $(node).css({ 'border-bottom': 'none' });
        }
    };

    var homepageStyleChange = function(scroll) {
        if(scroll) {
            $(".csr-header").css({
                "background-color": "rgba(255,255,255,1)",
                "box-shadow": "0 3px 10px 0 rgba(0,0,0,0.06)"
            });
            $('.csr-header #left').css({
                "background": "url('/static/img/new2018/header-logo-black.png') no-repeat",
                "background-size": "100%"
            });
            $('.csr-header a').css("color", "#000");
        } else {
            $(".csr-header").css({
                "background-color":"transparent",
                "box-shadow": "0 0px 0px 0 rgba(0,0,0,0.06)"
            });
            $('.csr-header #left').css({
                "background": "url('/static/img/new2018/header-logo-white.png') no-repeat",
                "background-size": "100%"
            });
            $('.csr-header a').css("color", "#fff");
        }
    }

    /*
    $('#links').children('li').mouseout( () => {
        addActiveLine();
    })
    $('#links').children('li').mouseover((event) => {
        removeActiveLine(event);
    });
    */

    // 通过地址来判断当前页
    currentPage = location.href.split('/').splice(-1)[0];
    if (location.href.indexOf('/home/') > -1 || location.href.indexOf('/new/waimaiIndex') > -1 ) {
        currentPage = 'waimai';
    } else if (location.href.indexOf('/mobile/download/default') > -1) {
        currentPage = 'download';
    }

    switch (currentPage) {
        // 首页
        case '':
            homepageStyleChange(false);
            $(window).scroll(function() {
                if($(window).scrollTop() > 0) {
                    homepageStyleChange(true);
                } else {
                    homepageStyleChange(false);
                }
            });
            page = 0;
            break;
        // 点外卖页
        case 'waimai':
            page = 4;
            break;
        // 下载页
        case 'download':
            page = 5;
            break;
        // 首页
        default:
            homepageStyleChange(false);
            $(window).scroll(function() {
                if($(window).scrollTop() > 0) {
                    homepageStyleChange(true);
                } else {
                    homepageStyleChange(false);
                }
            });
            page = 0;
            break;
    }
    addActive();
});
