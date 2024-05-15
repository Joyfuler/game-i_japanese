<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
	form#reply {margin-left: 30px;}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<body>
		<form action="${conPath }/commentReply.do" id = "reply" method = "post">
		<table>	
			<tr>	
				<td><input type = "hidden" name = "commentPageNum" value = "${empty param.commentPageNum? '1':param.commentPageNum }"></td>
				<td>
					<input type = "hidden" name = "bno" value = "${param.bno }">
					<input type = "hidden" name = "bcno" value = "${param.bcno }">
					<input type = "hidden" name = "mid" value = "${member.mid }">
					<input type = "hidden" name = "gid" value = "${param.gid }">
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;<img src = "${conPath }/memberPhotoUp/${member.mphoto }" height = "44px"><br>
					<b>${member.mnickname }</b>
				</td>
				<td>				
					<textarea rows="3" cols="30" name="bctext" style="width:500px; height:80px; float:left; margin: 5px; margin-left: 20px;" placeholder="コメントを入力"  required="required"></textarea>
				</td>
				<td>	
					<input type="submit" value="作成">
				</td>
			</tr>		
		</table>
	</form>
	<p style="clear:both;"></p>
</body>
</html>