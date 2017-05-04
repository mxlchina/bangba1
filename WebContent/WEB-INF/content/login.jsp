<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.net.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>帮吧登录</title>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style type="text/css">
.vertical-center{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
#login{
      display:"";
}

#regist{
      display:none;
}
#findPassword{
      display:none;
}
</style>

<%
    Cookie[] cookies =request.getCookies();
    String username="";
    String registPassword="";
    String rememberme="";
    String autologin= "";
    if(cookies != null){
    	for(Cookie c :cookies){
    	 	if("user".equals(c.getName())){
    			String user = URLDecoder.decode(c.getValue(),"utf-8");
    			System.out.println("user" + user);
    			username = user.split("-")[0];
    			registPassword = user.split("-")[1];
    			autologin = user.split("-")[2];
    		}
    	}
    	if(!"".equals(username)&&!"".equals(registPassword)){
    		request.setAttribute("username",username);
    		request.setAttribute("password",registPassword);
    		rememberme = "checked";
    	}
    }
    request.setAttribute("rememberme",rememberme);
    request.setAttribute("autologin",autologin);
%>
</head>
<body>

	<div id="login" class="container vertical-center" >
		<div class="col-md-6 col-md-offset-3">
		
			<form id="loginform" action="loginvalidate" method="post">
				<h2><font size="14">帮吧系统</font>&nbsp;&nbsp; <font>用户登录</font></h2>
				<label for="inputEmail" class="sr-only">用户名</label> 
				<input type="text" value="${username}"  name="username" id="inputEmail" class="form-control" placeholder="用户名" required autofocus>
				
				<label for="inputPassword" class="sr-only">密码</label>
			    <input type="password" value="${password}" name="password" id="password" class="form-control" placeholder="密码" required>
			   <!--  <label for="inputEmail" class="sr-only">验证码</label>
				<input type="text" name="pic" id="pic" class="form-control" placeholder="验证码" required> 验证码：<img src="authImg" width="120" height="40"> -->
				 <div class="checkbox">
		          <label>
		            <input type="checkbox" value="rememberme" id="rememberme" name="rememberme" ${rememberme}> 记住密码
		          </label>
		           &nbsp; &nbsp;&nbsp; &nbsp;
		           <label >
		            <input type="checkbox" value="checked"  id="autologin" ${autologin} name="autologin"> 自动登录
		          </label>
		         </div>
				
				<button id="loginBtn" class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
				 <label>
		            忘记密码? <a id="findPasswd"  onclick="findPasswd()">通过邮箱找回</a>
		          </label>
		          <br>
		           <label>
		            没有用户?  <a id="registId"  onclick="regist()">注册用户</a>
		          </label>
			</form>

		</div>
		</div>
	<!-- ---------注册----------- -->
		<div id="regist" class="container vertical-center" >
		<div class="col-md-6 col-md-offset-3">
		
			<form id="registform" action="regist" method="post">
				<h2><font size="14">帮吧系统</font>&nbsp;&nbsp; <font>用户注册</font></h2>
				<label for="role" class="sr-only">角色选择</label>角色选择 <span>*</span> 
				客户<input type="radio" name="role"  class="role" placeholder="用户名" required autofocus value="0">
				客服<input type="radio" name="role"  class="role" placeholder="用户名" required autofocus value="1">
				
				<label for="userInfo" class="sr-only">姓名</label>
			    <input type="text" name="userInfo" id="userInfo" class="form-control" placeholder="姓名" required>
			    
			    <label for="unit" class="sr-only">单位</label>
			    <input type="text" name="unit" id="unit" class="form-control" placeholder="单位" required>
			    
			    <label for="depart" class="sr-only">部门</label>
			    <input type="text" name="depart" id="depart" class="form-control" placeholder="部门" required>
			    
			    <label for="username" class="sr-only">登录名</label>
			    <input type="text" name="username" id="username" class="form-control" placeholder="登录名" required>
			    
			    <label for="inputPassword" class="sr-only">密码</label>
			    <input type="text" name="registPassword" id="registPassword" class="form-control" placeholder="密码" required>
			    
			     <label for="inputPassword1" class="sr-only">确认密码</label>
			     <input type="text" name="registPassword1" id="registPassword1" class="form-control" placeholder="确认密码" required>
			    
			  
			    
			    <label for="sex" class="sr-only">性别</label>性别 <span>*</span> 
				男<input type="radio" name="sex" value="0" class="sex" placeholder="用户名" required >
				女<input type="radio" name="sex" value="1" class="sex" placeholder="用户名" required >
			    
			    
			    <label for="birthday" class="sr-only">生日</label> 
			    <input type="text" name="birthday" id="birthday" class="form-control" placeholder="生日" required>
			    
			    <label for="location" class="sr-only">所在地</label>
			    <input type="text" name="location" id="location" class="form-control" placeholder="所在地" required>
			    
			    <label for="iphone" class="sr-only">手机号</label>
			    <input type="text" name="iphone" id="iphone" class="form-control" placeholder="手机号" required>
			    
			    <label for="email" class="sr-only">邮箱</label>
			    <input type="text" name="email" id="mail" class="form-control" placeholder="邮箱" required>
			    <div>我已阅读服务条款</div>
			    <button id="registBtn" class="btn btn-lg btn-primary btn-block" type="submit">立即注册</button>
			</form>
		</div>
		</div>
	
		<!-- 找回密码 -->
		<div id="findPassword" class="container vertical-center">
		    <div class="col-md-6 col-md-offset-3">
		        <h2><font size="14">帮吧系统</font>&nbsp;&nbsp; <font>找回密码</font></h2>
		        <form id="findPasswordForm" action="findPassword" method="post">
		        <label for="inputEmail" class="sr-only">用户名</label> 
				<input type="text"  name="findusername" id="findusername" class="form-control" placeholder="用户名" required autofocus>
		        <label for="email" class="sr-only">邮箱</label>
			    <input type="text" name="findemail" id="findemail" class="form-control" placeholder="注册邮箱" required>
			    <button id="findPasswordBtn" class="btn btn-lg btn-primary btn-block" type="button">找回密码</button>
			    </form>
		    </div>
		</div>
	<script type="text/javascript">
	
  	
		 $("#findPasswordBtn").click(function(){
			 $("#findPasswordForm").submit();
		 })
   	
	    $(function(){ 
	    var findPassword = '${findPassword}';
	    if(findPassword=='0'){
	    	alert('密码找回成功，请查看邮箱');
	    }else if(findPassword=='1'){
	    	alert('密码找回失败，请检查邮箱是否正确');
	    }
	    	
	    	
	   	 if ($('#autologin').attr('checked')) {
	        setTimeout(loginBtnClick,'3000');
	   	 }
		}); 
	    
	    function loginBtnClick(){
	    	 if ($('#autologin').attr('checked')) {
	    	     $("#loginBtn").click();
	    	 }
	    }
	    function regist(){
		$("#login").hide();
		$("#regist").show();
	     }
	    
	    function findPasswd(){
			$("#login").hide();
			$("#findPassword").show();
		}
	</script>
</body>
</html>
