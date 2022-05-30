<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 450px;
}

.td_left {
	width: 150px;
	background: orange;
}

.td_right {
	width: 300px;
	background: skyblue;
}

#commandCell {
	text-align: center;
}
</style>
</head>
<body>
	<!-- 게시판 등록 -->

	<section id="./writeForm">
		<h2>게시판글등록</h2>
		<form action="./boardwrite" method="post"
			enctype="multipart/form-data" name="boardform">
			<table>
				<tr>
					<td class="td_left"><label for="board_name">글쓴이</label></td>
					<td class="td_right">
						<input type="text" name="board_name" id="board_name" required="required" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="board_pass">비밀번호</label></td>
					<td class="td_right">
						<input name="board_pass" type="password" id="board_pass" required="required" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="board_subject">제 목</label></td>
					<td class="td_right">
						<input name="board_subject" type="text"	id="board_subject" required="required" />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="board_content">내 용</label></td>
					<td><textarea id="board_content" name="board_content"
							cols="40" rows="15" required="required">
						</textarea>
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="board_file"> 파일 첨부 </label></td>
					<td class="td_right">
						<input name="file" type="file" id="file" />
					</td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="등록">&nbsp;&nbsp; <input
					type="reset" value="다시쓰기" />
			</section>
		</form>
	</section>
	<!-- 게시판 등록 -->
</body>
</html>