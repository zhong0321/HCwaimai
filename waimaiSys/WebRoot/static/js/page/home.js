/**
 * �̼��б�ҳ��Ľṹ��
 *
 * @author xukai@meituan.com
 * @date 2014-01-24 ������
 *
 * @code review by heyanqiu (heyanqiu@meituan.com)
 * @date 2014-06-13 ������
 */

require.config({
    baseUrl: MT.STATIC_ROOT + '/js'
});

require(['lib/jquery', 'module/general', 'module/get-restaurants', 'module/user', 'module/interface', 'module/bannernew', 'widget/dialog/TipsDialog', 'widget/dialog/HoverDialog', 'util/utils', 'lib/jquery/easing', 'util/request', 'module/ceiling', 'module/bridge', 'module/search', 'module/sidebar', 'module/mtgs'], function($, general, restList, user, i, banner, TipsDialog, HoverDialog, utils, easing, request, ceiling, bridge, search, sidebar, mtgs) {
    'use strict';

    // TOP ��ʷ��ַ
    (function() {
        var changePositionDOM = $('#change-position');
        var addressListDOM = $('#address-list');
        var timer = null;

        changePositionDOM.hover(function() {
            addressListDOM.css({ display: 'block' });
        }, function() {
            timer = setTimeout(function() {
                addressListDOM.css({ display: 'none' });
            }, 200);
        });

        addressListDOM.hover(function() {
            clearTimeout(timer);
        }, function() {
            addressListDOM.css({ display: 'none' });
        });
    })();

    //�ղص��Ǹ����ĵ�DOM�������ڵ�¼�ɹ�����ղػص�
    var collectEl = null;

    var Page = {
        loadSearchDOM: function() {
            // ����div ����ӵ��ĵ���
            var jQdiv = $('#searchBox');

            search(jQdiv);
        },
        run: function() {
            this._init();

            function setCookie(cname, cvalue, exdays) {
                var d = new Date();
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toUTCString();
                document.cookie = cname + "=" + cvalue + "; " + expires;
            }

            $(".banner-qrcode").on("click", '.close', function() {
                var me = $(this);
                setCookie("activity_flag", "1", 1);
                me.parents(".banner-qrcode").remove();
            });
            this._announcement();
        },
        _announcement: function() {
            var cityId = (window.getCookie("w_cid") || '').slice(0, 3);
            var cityName = window.getCookie("w_cpy");
            var ANNOUNCE_HTML = mtgs.ANNOUNCE_HTML;
            if (true || cityId == "110" || cityName == "beijing") {
                var newDiv = document.createElement('div');
                newDiv.innerHTML = ANNOUNCE_HTML
                var topNode = document.getElementById('announcement-area');
                topNode.appendChild(newDiv);
            }
        },
        _init: function() {
            this.ul = $('.rest-list ul');
            this.ulOffset = this.ul.offset();
            this.qrCode = $('#stickQrcode');
            this.jQsorter = $('#sortFilter');
            this.jQimgsorter = $('.imgsort-wrapper');
            this.jQimgsorterHover = $('.jq-hover');
            this._pageData = {};
            this._initPageData();
            this._initEvent();
            this.sendPageView();

            // ע���ղز�����������¼�ɹ�������ղ�
            bridge.register('user:login', function() {
                if (collectEl) {
                    Page.saveUp(collectEl, Page);
                }
            });

            // ��ʾ��qrcode
            if (!$.cookie('h_qrcode')) {
                console.log(); //�����ã��Ժ��ɾ��
                $('.stick-qrcode').removeClass('hidden');
            }
        },

        _initPageData: function() {
            var dataTemplate = $('#page-data-template').html();
            try {
                this._pageData = JSON.parse(dataTemplate) || {};
            } catch (e) {;
            }
        },

        _initEvent: function() {
            var self = this;
            this.ul.on('mouseenter', '.rest-outer', this.addClassHover)
                .on('mouseleave', '.rest-outer', this.removeHoverClass);
            this.jQimgsorter.find('li').hover(this.addHoverClass, this.removeHoverClass);
            this.ul.on('click', '.j-save-up', this.checkLogin(self));

            if (this._pageData['page'] == 'home_ordered') {
                this.ul.on('click', '.restaurant', function() {
                    self._sendOrderedLog(this);
                });
            }

            var timer;
            this.ul.on('mouseenter', '.restaurant', function() {
                if (this.className.indexOf('empty') != -1) {
                    return;
                }

                //var This = $(this);
                //timer && clearTimeout(timer);
                //timer = setTimeout(function() {
                //  self.showDiscount(This);
                //}, 500);
            });

            //�¼�������jq-hover���class��div�ϣ����û���򲻰�
            if (this.jQimgsorterHover.size()) {
                var jQsortupTimer = null;
                this.jQimgsorterHover.hover(function() {
                    var jQthis = $(this);
                    //�ӳ�200ms ��ֹ���ٻ�����ʱ��Ҳչ���б�
                    jQsortupTimer = setTimeout(function() {
                        jQthis.animate({
                            'height': '208'
                        }, 200);
                        jQthis.addClass('mouseIn');
                    }, 200);
                }, function() {
                    clearTimeout(jQsortupTimer);
                    var jQthis = $(this);
                    jQthis.animate({
                        'height': '85'
                    }, 200);
                    jQthis.removeClass('mouseIn');
                });
            }

            this.ul.on('mouseleave', '.restaurant', function() {
                clearTimeout(timer);
                self.hideDiscount($(this));
            });

            this.jQsorter.find('.prices').hover(this.addClassHover, this.removeHoverClass);

            this.qrCode.find('.i-qrcode-cross').on('click', function(evt) {
                self.hideQrcode($(this));
                evt.preventDefault();
                evt.stopPropagation();
            });

            // ���������߼�
            this.ul.on('click', '.rest-atag', function(evt) {
                evt.preventDefault();
                var sourceEl = $(this),
                    goHref = sourceEl.attr('href'),
                    pos = sourceEl.attr('data-pos');

                var token = Rohr_Opt.reload('http://' + 'waimai.meituan.com' + goHref);
                window.open(goHref + '?post=' + pos + '&_token=' + token);
            });
        },
        // ȷ����¼������ղ�
        saveUp: function(objEl, obj) {
            var jQthis = $(objEl),
                poiid = jQthis.data('poiid');

            if (!jQthis.hasClass('favorite')) {
                request.post(i.favoriteRest, {
                    poiIdStr: poiid,
                    from: 'home'
                }, function(ret) {
                    if (ret.code == 0) {
                        jQthis.removeClass('un-favorite').addClass('favorite')
                            .attr('title', 'ȡ���ղ�');
                        if (jQthis.parents('li').index() == 0) {
                            return;
                        }
                        obj.moveTofirst(jQthis, obj);
                    } else {
                        if (ret.code == 1) {
                            utils.showError('���¼�����ղ�');
                        } else {
                            utils.showError('�Բ����ղ�ʧ��...');
                        }
                    }
                });
            } else {
                request.post(i.unfavoriteRest, {
                    poiIdStr: poiid,
                    from: 'home'
                }, function(ret) {
                    if (ret.code == 0) {
                        jQthis.removeClass('favorite').addClass('un-favorite')
                            .attr('title', '�ղص���');
                    } else {
                        if (ret.code == 1) {
                            utils.showError('���¼����ȡ���ղ�');
                        } else {
                            utils.showError('�Բ���ȡ���ղ�ʧ��...');
                        }
                    }
                });
            }
        },
        // �ղصĶ���
        moveTofirst: function(jQobj, obj) {
            var jQthis = jQobj,
                jQparentDiv = jQthis.parents('.j-rest-outer'),
                jQparentLi = jQthis.parents('li'),
                jQparentUl = obj.ul,
                jQlis = jQparentUl.children(),
                jQulOffset = obj.ulOffset,
                jQliOffset = jQparentLi.offset(),
                jQfirstLi = jQlis.eq(0),
                jQfirstLiOffset = jQfirstLi.offset(),
                top = jQliOffset.top - jQulOffset.top,
                left = jQliOffset.left - jQulOffset.left,
                destTop = jQfirstLiOffset.top - jQulOffset.top,
                destLeft = jQfirstLiOffset.left - jQulOffset.left;
            //�ɵ�ʱ�����hover����ȥ����transition��Ӱ��ɣ�ȥ���������ټ�
            jQparentDiv.removeClass('hover transition')
                .css({
                    position: 'absolute',
                    top: top + 'px',
                    left: left + 'px',
                    zIndex: 1
                })
                .animate({
                    top: destTop + 'px',
                    left: destLeft + 'px'
                }, 1000, 'easeInOutQuint', function() {
                    jQparentDiv.addClass('transition');
                    jQparentLi.insertBefore(jQfirstLi);
                    // ���еķָ��߶�����ǰŲ1λ���Ƚ϶���
                    var i = 0;
                    jQparentUl.children().each(function() {
                        var jQelem = $(this);
                        if (i == 5 && jQelem.hasClass('j-rest-separate')) {
                            i = 0;
                            jQelem.insertBefore(jQelem.prev());
                        }
                        i++;
                    });
                    jQparentDiv.attr('style', '');
                });
        },

        //�ղ�֮ǰ����¼
        checkLogin: function(obj) {
            return function() {
                var self = this;
                if (!user.isLogin()) {
                    require(['module/dialog/login'], function(login) {
                        login.show();
                    });
                    collectEl = self;
                } else {
                    obj.saveUp(this, obj);
                }
            };
        },

        showDiscount: function(tar) {
            var tipsContent = '';
            var jQtrigger = $(tar),
                scripts = jQtrigger.find('script'),
                position = jQtrigger.offset();

            if (scripts.size() == 0) {;
            } else {
                tipsContent += '<div class="title">�̼���Ϣ</div><ul>';
                $.each(scripts, function(index, script) {
                    tipsContent += '<li class="clearfix"><i class="fl discount-icon ';
                    if ($(script).data('pic')) {
                        tipsContent += $(script).data('icon') + '"><img src="' + $(script).data('pic') + '"  height="17" width="17" />';
                    } else {
                        tipsContent += 'icon ' + $(script).data('icon') + '">';
                    }
                    tipsContent += '</i><span class="discount-content">' + $(script).html() + '</span></li>';
                });
                tipsContent += '</ul>';
            }
            var bulletin = $.trim(tar.data('bulletin'));
            tipsContent += '<div class="broadcaster"><div Fclass="sub-title">�̼ҹ���</div><div class="broadcontent">'
            if (bulletin.length != 0) {
                var ph = new Date().getTime();
                var replaced = utils.encodelHtmlChar(bulletin.replace(/<br\ \/>/g, ph)).replace(new RegExp(ph, 'g'), '<br />');
                tipsContent += replaced;
            } else {
                tipsContent += '<span class="no-broadcaster">��</span>';
            }
            tipsContent += '</div></div>';

            position.left += jQtrigger.width();
            position.top -= 18;
            var options = {
                klass: 'dialog-discount',
                content: tipsContent
            };
            if ((position.left + 273) > $(window).width()) {
                options.direction = 'right';
                position.left -= jQtrigger.width() + 273;
            }
            this.tipsDialog = new TipsDialog(options);
            this.tipsDialog.setContent(tipsContent).show(position);
        },

        hideDiscount: function() {
            this.tipsDialog && this.tipsDialog.destroy();
        },

        addHoverClass: function() {
            var self = $(this);
            if (self.children('.rest-mask').size() != 0) {
                return;
            } else {
                $(this).addClass('hover');
            }
        },

        addClassHover: function() {
            $(this).addClass('hover');
        },

        removeHoverClass: function() {
            $(this).removeClass('hover');
        },

        hideQrcode: function(tar) {
            var self = tar,
                stickQrcode = self.parents('.stick-qrcode');

            if ($.cookie('h_qrcode') == 1) {
                return;
            }
            stickQrcode.addClass('hidden');
            var date = new Date();
            date.setTime(date.getTime() + (24 * 60 * 60 * 1000));
            $.cookie('h_qrcode', 1, {
                expires: date
            });
        },

        _sendOrderedLog: function(elem) {
            var poiid = $(elem).data('poiid');
            request.get(i.homeOrderedLog + '/' + poiid);
        },

        sendPageView: function() {
            // �ж���Ƶ��ҳ������ҳ
            var pathArray = window.location.href.split('/');
            var lastPath = pathArray[pathArray.length - 1];
            var regexp = /^\S+-\d+/;
            var isHome = regexp.test(lastPath) ? false : true;

            // ��ҳ
            if (isHome) {
                LXPV('c_m84bv26', function(valLab) {
                    valLab = $.extend(valLab, {
                        'stid': '',
                        'keyword': '',
                        'activityid': '',
                        'custom': {
                            'city_id': $.cookie('w_cid') ? $.cookie('w_cid') : '',
                            'ys': '',
                            'ys_id': '',
                        },
                    });
                    return valLab;
                });
            } else {
                // Ƶ��ҳ
                LXPV('c_i5kxn8l', function(valLab) {
                    valLab = $.extend(valLab, {
                        'cat_id': lastPath.split('-')[1],
                        'stid': '',
                    });
                    return valLab;
                });
            }
        }
    };

    Page.loadSearchDOM();
    Page.run();
    console.log("������������ɶ����!!");
});
