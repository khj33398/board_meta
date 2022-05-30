<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
	<title>MVC 게시판</title>
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	</script>
	<style type="text/css">
   #registForm{
      width: 500px;
      height: 600px;
      border : 1px solid red; 
      margin:auto; 
   }   
   h2{
      text-align: center;
   }
   table{
      margin:auto;
      width: 450px;
      }
   .td_left{
      width: 150px;
      background:orange;
   }
   .td_right{
      width: 300px;
      background:skyblue;
   }
   #commandCell{
      text-align: center;
      
   }
</style>
</head>
<body>
<!-- 게시판 등록 -->

<section id = "writeForm">
<h2>게시판글수정</h2>
<form action="boardmodify" method="post" name = "modifyform">
<input type = "hidden" name = "board_num" value = "${article.board_num}"/>
<table>
	<tr>
		<td class="td_left">
			<label for = "board_name">글쓴이</label>
		</td>
		<td class="td_right">
			<input type = "text" name="board_name" id = "board_name" value = "${article.board_name}"/>
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "board_pass">비밀번호</label>
		</td>
		<td class="td_right">
			<input name="board_pass" type="password" id = "board_pass"/>
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "board_subject">제 목</label>
		</td>
		<td class="td_right">
			<input name="board_subject" type="text" id = "board_subject" value = "${article.board_subject}"/>
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "board_content">내 용</label>
		</td>
		<td>
			<textarea id = "board_content" name="board_content" cols="40" rows="15">${article.board_content}</textarea>
		</td>
	</tr>
</table>
	<section id = "commandCell">
			<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>
	</section>
</form>
</section>
</body>
</html>