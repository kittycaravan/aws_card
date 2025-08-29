<!-- 0. 웹 애플리케이션의 루트 경로(컨텍스트 경로) 를 가져와서 링크에 다 연결해줘야 함     -->
<!-- 1. 0을 위한 준비. jstl core 태그 선언     -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 2. 0을 위한 준비. el 태그로 가져올 수 있는데 이걸 더 짧게 찍기위해 변수 대입함.     -->
<c:set var="cp" value="${pageContext.request.contextPath}" /><!-- el변수 cp에 경로저장 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${cp}/resources/common.css" >
	
	<script defer="defer" src="${cp}/resources/static/js/main.8edb0ad8.js"></script> <!-- 리액트.js 빌드한 파일꺼 연결 -->
	<link href="${cp}/resources/static/css/main.49e6a1ce.css" rel="stylesheet"> <!-- 리액트.js 빌드한 파일꺼 연결 -->	
		
</head>
<body>
<h1>
	내 홈페이지 !  
</h1>
<img src="${cp}/resources/cat.jpg">
<a href="${cp}/guest/getList">[방명록]</a>
<a href="${cp}/weather/w">날씨 확인하러 가기</a>
<hr>
<a href="${cp}/api/test?n=강야옹">야옹이 json api</a>
<a href="${cp}/api/cat">야옹이 api</a>
<hr>
<a href="${cp}/game/play">게임</a>
<hr>
<a href="${cp}/card/play">카드 가챠 게임</a>
<div id="root"></div> <!-- React가 렌더링될 요소 -->
</html>
