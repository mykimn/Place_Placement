<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자리배치</title>
</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Black+Han+Sans|Faster+One|Gugi|Press+Start+2P|VT323');
*{
	font-family:'Black Han Sans';
}
#infor{
	width:100%;
	height:170px;
	margin:0;
	padding:0;
	background-color:#f7cac9;
	opacity:0.6;
}
body{
background-image:url('classroom2.jpg');
background-size:cover;
}
input[type=checkbox]{
width:22px;
height:22px;
border:1px solid #f7cac9;
border-radius:10px;
}
input[type=submit]{
	width: 15%;
    height: 50px;
    background-color: #92a8d1;
    color: black;
    border: none;
    border-radius: 100px;
    cursor: pointer;
    margin-top:2%;
    font-size:xx-large;
    display:inline;
    margin-left:4%;
    margin-top:-0.2%;
}
table{
	align:center;
	border:3px solid white;
	font-size:xx-large;
	margin-top:5%;
}
table td{
width:100px;
height:60px;
border:3px solid white;
text-align:center;
background: -webkit-linear-gradient(20deg, rgb(245,201,201), rgb(145,166,207));
}
</style>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int student = Integer.parseInt(request.getParameter("student"));
	int label = Integer.parseInt(request.getParameter("label"));

%>
<div id="infor">
<form method="post" action="startPlace.jsp">
<p style="font-size:xx-large; margin-left:27.5%; margin-top:1%; display:inline-block;">인원 수 : <font color="red"><%=student %></font> 명</p>
<input type="submit" value="자리배치 시작!">
<p style="font-size:xx-large; margin-left:4%; margin-top:1%; display:inline-block;">분단 수 : <font color="red"><%=label %></font> 분단</p>
<p style="margin-left:10%; font-size:x-large; margin-top:0%;">결시 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%
	for(int i = 1;i<=student;i++){%>
		<label style="font-size:x-large;"><%=i%></label> <input type="checkbox" name="student" value="<%=i %>">&nbsp;
	<% 	
		if(i%20==0){%>
			<br>
	<%	}
	}
%>
</form>
</div>
<div>
<%
	int count = student/(label*2);
	int nmg = student%(label*2);
	int number=0;
	
	if(nmg!=0){
		count++;
	}
	
	for(int i=0;i<label;i++){
		
		if(i==0){
			if(label==2){%>
				<table style="display:inline-block; margin-left:35%; margin-right:5%;" cellspacing=0 cellpadding=0>
<% 			}
			if(label==3){%>
				<table style="display:inline-block; margin-left:26.5%; margin-right:5%;" cellspacing=0 cellpadding=0>
<% 			}
			if(label==4){%>
			<table style="display:inline-block; margin-left:18.6%; margin-right:5%;" cellspacing=0 cellpadding=0>
<% 			}
		}
		else{%>
			<table style="display:inline-block; margin-right:5%;" cellspacing=0 cellpadding=0>
<%  	}
%>

<% 		for(int j=0;j<count;j++){
		++number; %>
		<tr>
<% 			if(number>student && (count*label-number==2)){%>
				<td>자리X</td>
				<td>자리X</td>
<% 			}
			else if((number+1==student) && (count*label-number==1)){ %>
				<td><%=number%></td>
				<td>자리X</td>	
<%			}
			else{ %>
				<td><%=number %></td>
				<td><%=++number %></td>
<% 			}%>
		</tr>
<% 		}%>
		</table>
<%  	}
%>
</div>
</body>
</html>
