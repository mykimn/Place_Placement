<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Black+Han+Sans|Faster+One|Gugi|Press+Start+2P|VT323');
*{
	font-family:'Black Han Sans';
}
p{
color:#f7cac9;
text-shadow: -1px 0 #92a8d1, 0 10px #92a8d1, 10px 0 #92a8d1, 0 -1px #92a8d1;
-moz-text-shadow: -1px 0 #92a8d1, 0 20px #92a8d1, 20px 0 #92a8d1, 0 -1px #92a8d1;
-webkit-text-shadow: -1px 0 #92a8d1, 0 10px #92a8d1, 10px 0 #92a8d1, 0 -1px #92a8d1;
font-size:100px;
margin-left:30%;
margin-top:15%;
}
body{
background-image:url('classroom2.jpg');
background-size:cover;
}
input[type=submit]{
	width: 20%;
    height: 80px;
    background-color: #92a8d1;
    color: black;
    padding: 10px 20px;
    border: none;
    border-radius: 100px;
    cursor: pointer;
    margin-top:2%;
    margin-left:38%;
    font-size:xx-large;
    display:inline;
}
input[type=text]{
	width: 10%;
    height: 40px;
    background-color: #92a8d1;
    color: black;
    padding: 10px 20px;
    border: none;
    border-radius: 100px;
    cursor: pointer;
    margin-top:2%;
    font-size:xx-large;
    display:inline;
}
label{
	font-size:xx-large;
	margin-left:39%;
}
</style>
<script type="text/javascript">
function stu_validate(){
    form = document.myForm
    su = form.student.value
    if (su>=20 && su<=40) {
    	return true;
    }
    else{
        alert("인원수는 20명부터 40명까지 입력가능합니다.")
        form.reset();
        return false
    }
}
function label_validate(){
    form = document.myForm
    su1 = form.label.value
    if(su1>=2 && su1<=4){
    	return true;
    }
    else{
        alert("분단수는 2분단부터 4분단까지 입력가능합니다.")
        form.reset();
        return false
    }
}
</script>
</head>
<body>
<p>자라나라 자리자리</p>
<form method="post" action="goPlace.jsp" name="myForm">
<label>인원수 </label>&nbsp;&nbsp;<input type="text" name="student" required><br>
<label>분단수 </label>&nbsp;&nbsp;<input type="text" name="label" required><br>
<input type="submit" value="자리배치 하러가기" onclick="stu_validate(); label_validate();">
</form>
</body>
</html>