<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Stict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-
strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang = "zh-CN">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>豪吃外卖</title> 
    <style>
         body{
            background: #f2f1f6;
            background: url("static/files/waimaiBackground_500950652.jpg") no-repeat;
            background-size: 100% auto;

        }
        .login{
            background: white;
            width: 90%;
            border-radius: 20px 20px;
            padding: 1.2rem;
            margin: 2rem auto;
            font-size: 1rem;
        }
        input{
            margin-left: 2rem;
            border: 0;
            outline: none;
            background-color: rgba(0, 0, 0, 0);

        }
        .title{
            font-size: 1.2rem;
            height: 3rem;
            line-height: 3rem;
            margin-bottom: 1rem;
            display: flex;
            justify-content: space-between;
        }
        .phone,.password{
            border-bottom: solid 0.1rem #f2f1f6;
            height: 3rem;
            line-height: 3rem;
        }
        .login button{
            color: white;
            font-size: 1.1rem;
            border: none;
            background: #029ff9;
            width: 20rem;
            height: 3rem;
            border-radius: 80px 80px;
            margin: 1rem 1rem 0rem 0rem;
        }
        .title a{
            color: gray;
            font-size: 0.8rem;
            text-decoration-line: none;
        }
        .registBtn{
            color: black;

            border: solid 2px #CCCCCC;
            background: white;
            width: 20rem;
            height: 3rem;
            font-size: 1.1rem;
            border-radius: 80px 80px;
            margin: 1rem 1.1rem;
            position: absolute;
            bottom: 0.1rem;
        }
    </style>
</head>
<body>
    <form method="post" action="dmLogin/loginByPassword">
    	<div class="login">
	        <div class="title">
	            <span>密码登录</span>
	            <a href="">手机验证登录</a>
	        </div>
	        <div class="phone">
	            手机号 <input type="text" name="dmPhone"/>
	        </div>
	        <div class="password">
	            密码&nbsp;&nbsp;&nbsp; <input type="password" name="dmPassword"/>
	        </div>
	        <button>登录</button>
	    </div>
    </form>
    <button class="registBtn">注册</button>
</body>
</html>