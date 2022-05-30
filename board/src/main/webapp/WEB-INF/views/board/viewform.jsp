<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
#articleForm {
	width: 700px;
	height: 500px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

#basicInfoArea {
	height: 40px;
	text-align: center;
}

#articleContentArea {
	background: orange;
	margin-top: 20px;
	height: 350px;
	text-align: center;
	overflow: auto;
}

#commandList {
	margin: auto;
	width: 700px;
	text-align: center;
}
</style>
</head>

<body>
	<!-- 게시판 수정 -->
	<section id="articleForm">
		<h2>글 내용 상세보기</h2>
		<section id="basicInfoArea">
			제 목 : ${article.board_subject }
			첨부파일 :
			<c:if test="${article.board_file!=null }">
				<a href="file_down?downFile=${article.board_file}"> ${article.board_file} </a>
			</c:if>
	</section>
	<section id="articleContentArea">
		${article.board_content }
	</section>
	</section>
	<section id="commandList">
		<a href="replyform?board_num=${article.board_num}&page=${page}"> [답변] </a> 
		<a href="modifyform?board_num=${article.board_num}"> [수정] </a> 
		<a href="deleteform?board_num=${article.board_num}&page=${page}"> [삭제] </a>
		<a href="./boardlist?page=${page}"> [목록]</a>&nbsp;&nbsp;
	</section>
</body>
</html>