<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	닉네임: ${empty userInfo.mnickname? "(회원정보 없음)": userInfo.mnickname } / 등급: ${empty userInfo.mlevel? "없음": (userInfo.mlevel eq 1 ? "관리자":"일반회원")}
</body>
</html>