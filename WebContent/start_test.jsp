<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자리배치 다했어여</title>
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
input[type=submit],input[button]{
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
#s1{
	visibility:hidden;
}
#s1:hover, td{
	visibility:visible;
}
</style>
<script type="text/javascript">
function hide(elements){
	elements = elements.length ? elements : [elements];
	for (var index = 0; index < elements.length; index++) {
	  elements[index].style.visibility = 'visible';
	}
}
</script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int student = Integer.parseInt(request.getParameter("student"));
	String[] stu = request.getParameterValues("no_student");
	int[] no = new int[stu.length];
	for(int i = 0;i<stu.length;i++){
		no[i] = Integer.parseInt(stu[i]);	
	}
	int label = Integer.parseInt(request.getParameter("label"));

%>
<div id="infor">
<form method="post" action="index.jsp" id="myForm">
<p style="font-size:xx-large; margin-left:18.7%; margin-top:1%; display:inline-block;">인원 수 : <font color="red"><%=student %></font> 명</p>
<input type="submit" value="다시 배치!">
<input type="button" onclick='hide(document.querySelectorAll("#s1"));' value="한번에 확인!" style="	width: 15%;
    height: 50px;
    background-color: #92a8d1;
    color: black;
    border: none;
    border-radius: 100px;
    cursor: pointer;
    margin-top:2%;    font-size:xx-large;
    display:inline;
    margin-left:2%;
    margin-top:-0.2%;">
<p style="font-size:xx-large; margin-left:4%; margin-top:1%; display:inline-block;">분단 수 : <font color="red"><%=label %></font> 분단</p>
<p style="margin-left:36.2%; font-size:x-large; margin-top:0%;">결번 :&nbsp;&nbsp;&nbsp;&nbsp;
<%
	for(int i = 0; i<no.length;i++){
		if(i%10==0 && i!=0){%>
			<br>
<% 		}%>
		<span><%=no[i]%></span>&nbsp;&nbsp;
<% 	}
%>
</form>
</div>
<div>
<h1 style="margin-left:47.2%; margin-bottom:-4%; font-size:40px; color:green;">칠판</h1>
<%
	int random[];
	int st;
	if(no[0]==0){
		random = new int[student];
		st = student;
	}else{
		random = new int[student-no.length];
		st =student-no.length;
	}

	for(int i = 0; i<random.length;i++){
		random[i] = (int)(Math.random()*student)+1;
		
		for(int j =0;j<i;j++){
			if(random[i]==random[j]){
				i--;
				break;
			}
		}
		for(int k = 0;k<no.length;k++){
			if(random[i]==no[k]){
				i--;
				break;
			}
		}
	}
	
	int count = st/(label*2);
	int nmg = st%(label*2);
	int number=0;
	int cnt = 0;
	if(nmg!=0){
		count++;
	}
	
	for(int i=1;i<=label;i++){
		number = 2*(i-1);
		if(i==1){
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

<% 		for(int j=1;j<=count;j++){
			if(j!=1){
				if(label==2){
					number+=3;
				}
				if(label==3){
					number+=5;
				}
				if(label==4){
					number+=7;
				}
			}
	 	%>
		<tr>
<% 			if(number>st-1){%>
				<td>자리X</td>
				<td>자리X</td>
<% 			}
			else if((number==st-1) && (count*label*2-number)>=1){%>
				<td><span id="s1"><%=random[number]%></span></td>
				<td>자리X</td>
<% 			}
			else{ %>
				<td><span id="s1"><%=random[number]%></span></td>
				<td><span id="s1"><%=random[++number] %></span></td>
<% 			}%>
		</tr>
<% 		}%>
		</table>
<%  	}
%>
</div>
</body>
</html>