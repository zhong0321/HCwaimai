/**
 * 头顶黄条的逻辑
 */

define(['lib/jquery', 'module/user', 'module/interface', 'util/utils', 'util/request'], function($, user, itface, utils, request) {
  'use strict';

  var toptips = {
    _INTERVAL : 5*60*1000,  //5分钟获取一次
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

    //初始化内容
    _initContent : function() {
      var tipId = this._jQcontent.data('id');
      var tipContent = this._jQcontent.html();
      if (tipId) {
        this._currTip = tipId;
        this._currContent = tipContent;
        this.show();
      }
    },

    //初始化关闭事件
    _initCloseEvent : function() {
      var self = this;
      this._jQclose.click(function() {
        self.hide();
        self._markRead();
      });
    },

    //发送已读的回执
    _markRead : function() {
      if (this._currTip) {
        request.post(itface['readTip'],{
          id : this._currTip
        });
      }
      this._currTip = null;
      this._currContent = null;
    },

    //初始化获取tips的逻辑
    _initGetTips : function() {
      var self = this;
      setInterval(function() {
        self._getTips();
      }, this._INTERVAL);
    },

    //获取tips
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