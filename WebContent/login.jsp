<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="css/business-frontpage.css" rel="stylesheet">
		<title> 게시판 웹 사이트</title>
	</head>
	
	<body>
	<!-- Page Header -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a href="index.jsp" class="navbar-brand">Bulletin Board</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span> <!-- 화면이 좁아졌을 때 나타나는 아이콘 -->
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"> <!-- active : 한페이지에 하나만 들어갈 수 있는것으로 현재 선택된 페이지를 뜻함. -->
						<a class="nav-link" href="main.jsp">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">About</a>
					</li>
					<li class="nav-item">
						<a href="bbs.jsp" class="nav-link">게시판</a>
					</li>
					<li class="nav-item dropdown active">
						<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="ture" aria-expanded="false">접속하기<span class="sr-only">(current)</span></a>
						<div class="dropdown-menu" aria-labelledy="navbarDropdown">
							<a href="login.jsp" class="dropdown-item">로그인</a>
							<a href="join.jsp" class="dropdown-item">회원가입</a>
							<div class="dropdown-divider"></div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- Page Content -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4" style="margin:0px auto;">
			<div class="jumbotron" style="padding-top: 40px; margin-top:110px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로 그 인 화 면</h3><br>
					<div class="form-group">
						<input type="text" class="form-control"  name="userID" placeholder="아 이 디" maxlength="20"> <!-- maxlength : 최대 길이 -->
					</div><br>
					<div class="form-group">
						<input type="password" class="form-control" name="userPassword"  placeholder="비 밀 번 호" maxlength="20">
					</div><br>
					<input type="submit" class="btn btn-primary form-control" value="로 그 인">
				</form>
			</div>
		</div>
	</div>
	<div class="col-lg-4"></div>
	
	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; JSP Website 2019</p>
		</div>
	</footer>
	
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	</body>
</html>