<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
	%>
	<!-- Page Header -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a href="index.jsp" class="navbar-brand">Bulletin Board</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span> <!-- 화면이 좁아졌을 때 나타나는 아이콘 -->
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"> <!-- active : 한페이지에 하나만 들어갈 수 있는것으로 현재 선택된 페이지를 뜻함. -->
						<a class="nav-link" href="main.jsp">Home<span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">About</a>
					</li>
					<li class="nav-item">
						<a href="bbs.jsp" class="nav-link">게시판</a>
					</li>
				<%
					if(userID == null){
				%>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="ture" aria-expanded="false">접속하기</a>
						<div class="dropdown-menu" aria-labelledy="navbarDropdown">
							<a href="login.jsp" class="dropdown-item">로그인</a>
							<a href="join.jsp" class="dropdown-item">회원가입</a>
							<div class="dropdown-divider"></div>
						</div>
					</li>
				<%
					}else{
				%>
					<li class="nav-item"><a class="nav-link" href="logoutAction.jsp">로그아웃</a></li>
				<%
					}
				%>
				</ul>
			</div>
		</div>
	</nav>
	
	<header class="bg-primary py-5 mb-5">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-lg-12">
					<h1 class="display-4 text-white mt-5 mb-2">Bulletin Board</h1>
					<p class="lead mb-5 text-white-50">JSP 게시판 구현 </p>
				</div>
			</div>
		</div>
	</header>
	
  	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-md-8 mb-5">
				<h2>What We Do</h2><hr>
				<p>This is the home-page that implements the web bulletin board using JSP(JavaServer Page).</p>
				<p>JSP is a server-side scripting language that inserts Java code into HTML, dynamically generates web pages on a web server, and returns them to a web browser.</p>
				<a class="btn btn-primary btn-lg" href="#">Call to Action &raquo;</a>
			</div>
			<div class="col-md-4 mb-5">
				<h2>Contact Us</h2><hr>
				<address>
					<strong>JSP bulletin board Project</strong>
					<br>Sungshin Women's University
					<br>Convergence Security Engineering<br>
				</address>
				<address>
					<abbr title="Phone">P:</abbr>(123) 456-7890<br>
					<abbr title="Email">E:</abbr><a href="mailto:#">name@example.com</a>
				</address>
			</div>
		</div>	
		
		<div class="row">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<img class="card-img-top" src="http://placehold.it/300x200" alt="">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque sequi doloribus.</p>
					</div>
						<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<img class="card-img-top" src="image\성신로고.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque sequi doloribus totam ut praesentium aut.</p>
					</div>
						<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<img class="card-img-top" src="image\수룡.jpg" style="width:300; height:200;" alt="">
					<div class="card-body">
						<h4 class="card-title">수룡이</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
						<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
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