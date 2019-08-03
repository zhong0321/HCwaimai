/**
 * ҳ������������
 * ��header
 *
 * @author yuzhengfeng@meituan.com
 * @date 2018-08-22 ���ڶ�
 */

define(['lib/jquery', 'tpl/ceiling', 'module/search'], function($, tpl, search) {
  'use strict';

    var currentPage = '';
    var page = 0;

    // �����ҳ��ʱ, Ϊ��ǰҳ������active, bottom-border�Լ�font-weight
    var addActive = function() {
        var activeNode = $('#links').children('li')[page].firstChild;
        activeNode.classList.add('active');
    };

    var addActiveLine = function() {
        var activeNode = $('#links').children('li')[page].firstChild;
        $(activeNode).css({ 'border-bottom': '3px solid #FFBD27' });
    };


    // ������ƶ���������navʱ�����Ƴ���ǰҳ���active, bottom-border
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

    // ͨ����ַ���жϵ�ǰҳ
    currentPage = location.href.split('/').splice(-1)[0];
    if (location.href.indexOf('/home/') > -1 || location.href.indexOf('/new/waimaiIndex') > -1 ) {
        currentPage = 'waimai';
    } else if (location.href.indexOf('/mobile/download/default') > -1) {
        currentPage = 'download';
    }

    switch (currentPage) {
        // ��ҳ
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
        // ������ҳ
        case 'waimai':
            page = 4;
            break;
        // ����ҳ
        case 'download':
            page = 5;
            break;
        // ��ҳ
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
