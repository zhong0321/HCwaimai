/**
 * ͷ���������߼�
 */

define(['lib/jquery', 'module/user', 'module/interface', 'util/utils', 'util/request'], function($, user, itface, utils, request) {
  'use strict';

  var toptips = {
    _INTERVAL : 5*60*1000,  //5���ӻ�ȡһ��
    _jQwrap : $('#top-tips'),
    _jQcontent : null,
    _jQclose : null,
    _currTip : null,
    _currContent : null,

    init : function(options) {
      if (this._jQwrap.size()<=0) return;
      this._jQcontent = this._jQwrap.find('.j-top-tips-content');
      this._jQclose = this._jQwrap.find('.j-top-tips-close');

      this._initContent();
      this._initCloseEvent();
      this._initGetTips();
    },

    //��ʼ������
    _initContent : function() {
      var tipId = this._jQcontent.data('id');
      var tipContent = this._jQcontent.html();
      if (tipId) {
        this._currTip = tipId;
        this._currContent = tipContent;
        this.show();
      }
    },

    //��ʼ���ر��¼�
    _initCloseEvent : function() {
      var self = this;
      this._jQclose.click(function() {
        self.hide();
        self._markRead();
      });
    },

    //�����Ѷ��Ļ�ִ
    _markRead : function() {
      if (this._currTip) {
        request.post(itface['readTip'],{
          id : this._currTip
        });
      }
      this._currTip = null;
      this._currContent = null;
    },

    //��ʼ����ȡtips���߼�
    _initGetTips : function() {
      var self = this;
      setInterval(function() {
        self._getTips();
      }, this._INTERVAL);
    },

    //��ȡtips
    _getTips : function() {
      var self = this;
      request.get(itface['getTip'],null,function(response) {
        if (response.code==0) {
          var data = response.data;
          if (data && data.id && data.content) {
            self._currTip = data.id;
            self._currContent = data.content;
            self.show();
          }
        }
      });
    },

    show : function() {
      if (this._currTip && this._currContent) {
        this._jQcontent.data('id',this._currTip).html(this._currContent);
        this._jQwrap.show();
      }
    },

    hide : function() {
      this._jQwrap.hide();
    }
  };

  return toptips;
});