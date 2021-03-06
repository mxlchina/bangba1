<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>聊天室</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<script src="./js/jquery-1.12.3.min.js"></script>
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>
body {
	margin-top: 5px;
}

.tongzhi {
	width: 100%;
	height: 30%;
	border: 1px;
}

.gonggao {
	width: 100%;
	height: 70%;
	border: 1px;
}

#zhuandan {
	float: right;
	margin-right: 120px;
}

#paochu {
	float: right;
	margin-right: 20px;
}

.toolImg {
	width: 100px;
	height: 100px;
	margin: 20px 0 0 0;
}

.Mainframe {
	height: 100%
}

.userImg{
    display:block;
    float:left;
    border:0px;
}
.fontRed{
    color:red;
}
</style>
</head>
<body>



	<div class="container">

		<div class="row">
			<!-- 左侧工具 -->
			<div class="col-md-1">
				<div class="Mainframe panel panel-primary">
					<div class="panel-body">
						<div class="list-group">
							<div class="toolImg">
								<a><img src="image/toto1.png"></a>
							</div>
							<div class="toolImg">
								<a><img src="image/toto2.png"></a>
							</div>
							<div class="toolImg">
								<a><img src="image/toto3.png"></a>
							</div>
							<div class="toolImg">
								<a><img src="image/toto4.png"></a>
							</div>
							<div class="toolImg">
								<a><img src="image/toto5.png"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 左侧工具END -->

			<div class="col-md-3">
		<%-- 		<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">当前登录用户</h3>
					</div>
					<div class="panel-body">
						<div class="list-group">
							<a href="#" class="list-group-item">你好，${sessionScope.username}</a>
							<a href="logout" class="list-group-item">退出</a>
						</div>
					</div>
				</div> --%>
				<div class="panel panel-primary" id="online">
					<div class="panel-heading">
						<h3 class="panel-title">
							<input type="text" id="myinput" class="form-control " />
						</h3>
					</div>
					<div class="panel-body">
						<div class="list-group" id="users"></div>
					</div>
				</div>
			</div>


			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-primary">
							<div class="panel-body" style="background-color: gray">
								<div id="pannelTitle">
								    <!-- 页面显示内容 -->
								    <div id="talkUser" style="float:left">
								    </div>
								    <div id="titleButton" style="float:right;">
									    <button id="zhuandan" type="button" class="btn btn-primary">转单</button>
										<button id="paochu" type="button" class="btn btn-primary">抛出</button>
								    </div>
									
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-10">

						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title" id="talktitle"></h3>
							</div>
							<div class="panel-body">
							    <div  style="height: 150px; overflow-y: scroll">
							        <ul class="nav nav-tabs">
							            <li class="active"><a href="#tab1" data-toggle="tab">创建问题</a></li>
							            <li><a href="#tab2" data-toggle="tab">问题列表</a></li>
							        </ul>
							        <div id="myTabContent" class="tab-content">
							            <div class="tab-pane fade in active" id="tab1">
							            <table class="table">
							                <caption></caption>
							                <tr>
							                    <td>姓名</td> <td><input type="text" name="username"></td>
							                    <td>单位</td> <td><input type="text" name="workunit"></td> 
							                    <td>人员编号</td><td><input type="text" name="workno"></td>
							                </tr>
							                  <tr>
							                    <td>姓名</td> <td><input type="text" name="username"></td>
							                    <td>单位</td> <td><input type="text" name="workunit"></td> 
							                    <td>人员编号</td><td><input type="text" name="workno"></td>
							                </tr>
							                  <tr>
							                    <td>姓名</td> <td><input type="text" name="username"></td>
							                    <td>单位</td> <td><input type="text" name="workunit"></td> 
							                    <td>人员编号</td><td><input type="text" name="workno"></td>
							                </tr>
							                  <tr>
							                    <td>姓名</td> <td><input type="text" name="username"></td>
							                    <td>单位</td> <td><input type="text" name="workunit"></td> 
							                    <td>人员编号</td><td><input type="text" name="workno"></td>
							                </tr>
							            </table>
							            </div>
							            <div class="tab-pane fade" id="tab2">
							            tab2
							            </div>
							        </div>
							    </div>
								<div class="well" id="log-container"
									style="height: 250px; overflow-y: scroll"></div>
								<input type="text" id="myinfo" class="form-control col-md-12" />
								<br>
								<button id="send" type="button" class="btn btn-primary">发送</button>
							</div>
						</div>
					</div>

					<!-- 右侧广告栏位 -->
					<div class="col-md-2">
						<div class="panel panel-info"
							style="height: 520px; margin-left: 0px;">
							<div class="tongzhi">
								<font style="color: blue">通知:</font><br>
								${sessionScope.notice}
							</div>

							<div class="gonggao">
								<font style="color: blue">公告:</font><br>
								${sessionScope.announcement}
							</div>
						</div>
					</div>
				</div>
				<!-- 广告栏位结束 -->
			</div>
		</div>
		<!-- DIV ROW end -->
	</div>
	
	
	<!-- container end -->
	<script>
	var talkTitle;
    $(document).ready(function() { 
        // 指定websocket路径
        var websocket;
        if ('WebSocket' in window) {
			websocket = new WebSocket("ws://localhost:8080/bangba/ws?uid="+${sessionScope.uid});
		} else if ('MozWebSocket' in window) {
			websocket = new MozWebSocket("ws://localhost:8080/bangba/ws"+${sessionScope.uid});
		} else {
			websocket = new SockJS("http://localhost:8080/bangba/ws/sockjs"+${sessionScope.uid});
		}
        //var websocket = new WebSocket('ws://localhost:8080/bangba/ws');
        websocket.onmessage = function(event) {
       	 var data=JSON.parse(event.data);
       	 	if(data.from>0||data.from==-1){//用户或者群消息
            // 接收服务端的实时消息并添加到HTML页面中
            $("#log-container").append("<div class='bg-info'><label class='text-danger'>"+data.fromName+"&nbsp;"+data.date+"</label><div class='text-success'>"+data.text+"</div></div><br>");
            // 滚动条滚动到最低部
            scrollToBottom();
            }else if(data.from==0){//上线消息
            	if(data.text!="${sessionScope.username}")
            	{	
            		//显示用户头像及用户的具体信息
            		 // $("#users").append('<a href="#" onclick="talk(this)" class="list-group-item" >'+ '<img  class="userImg1" src="image/toto1.png" alt="用户头像" /><div style="float:left">'
            			//	 + data.text+'</a');
            		
            		$("#users").append( '<div onclick="talk(this)"  class="list-group-item">' + '<img class="userImg" src="image/toto1.png" alt="用户头像" />'+data.text+'</div><div style="clear:both"/> ');
            		//alert(data.text+"上线了");
            	}
            }else if(data.from==-2){//下线消息
            	if(data.text!="${sessionScope.username}")
            	{	
            		$("#users > a").remove(":contains('"+data.text+"')");
            		//alert(data.text+"下线了");
            	}
            }
        };
        //登录后显示所有客户人员
        $.post("onlineusers",function(data){
    		for(var i=0;i<data.length;i++)
    			//$("#users").append('<a href="#" onclick="talk(this)" class="list-group-item" >'+ '<img class="userImg1" src="image/toto1.png" alt="用户头像" /></a>'+data[i]+'</a>');
    			
    			$("#users").append('<div  onclick="talk(this)" class="list-group-item"> ' +'<img class="userImg" src="image/toto1.png" alt="用户头像" />'+data[i]+'</div><div style="clear:both"/> ');
    			
        });
        
        $("#broadcast").click(function(){
        	$.post("broadcast",{"text":$("#msg").val()});
        });
        
        
    });
   
   function talk(a){
	    $(a).addClass("fontRed").siblings().removeClass("fontRed");
        $("#talktitle").html("与"+$("span",a).html()+"的聊天");
        initTalkTitle($(a).html());
   }
   
   function scrollToBottom(){
		var div = document.getElementById('log-container');
		div.scrollTop = div.scrollHeight;
	}
   
   //搜索框
   $(function(){  
                 var t = $('#myinput'); //获取到文本域对象  
                 t.css("color","#A9A9A9"); //设置文本域的样式  
                  t.val("搜索"); //设置默认显示文字  
                 var default_value = t.val(); //把默认显示的文字赋给一个变量  
                   
                  t.focus(function() {  //当鼠标点击文本域时修改文本域的样式，判断文本域内的文字是否等于默认值，如果等于就把文本域内设空  
                     t.css("color","black");  
                     if (t.val() == default_value) {  
                         t.val('');  
                     }  
               });  
    
                 t.blur(function() { //当文本域失去鼠标焦点时判断文本域中的值是否为空，如果为空就把文本域的值设置为默认显示的文字并修改样式  
                       t.css("color","black");  
                    if (t.val() == '') {  
                        t.val(default_value);  
                         t.css("color","#A9A9A9");  
                     }  
                  });  
	 }); 
    
    function initTalkTitle(data){
    	$("#talkUser").html(data);
    }
</script>
</body>
</html>
