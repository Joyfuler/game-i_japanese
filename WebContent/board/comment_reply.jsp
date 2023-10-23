<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		<form action="${conPath }/commentReply.do">
		<input type="text" name="bno" value="${boardComments.bno }">
		<input type="text" name="bcno">
		<textarea rows="2" name="bctext"></textarea>
		<input type="submit" value="수정">
	</form>
</body>
</html>