<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
	  	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="css/business-frontpage.css" rel="stylesheet">
		<title> 게시판 웹 사이트</title>
		<style type="text/css">
			a, a:hover{
				color: #000000;
				text-decoration: none;
			}
		</style>
	</head>
	
	<body>
 	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
					<li class="nav-item"> <!-- active : 한페이지에 하나만 들어갈 수 있는것으로 현재 선택된 페이지를 뜻함. -->
						<a class="nav-link" href="main.jsp">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">About</a>
					</li>
					<li class="nav-item active">
						<a href="bbs.jsp" class="nav-link">게시판<span class="sr-only">(current)</span></a>
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
	
	<!-- Page Content -->
	<div class="container" style="margin-top:90px; margin-bottom:50px;">
		<div class="row" style="min-height:300px;">
			<table class="table table-stripted" style="text-align: center;">
				<thead> <!-- 제목부분 -->
					<tr>
						<th style="background-color: #D7B9E4;  border-left:2px solid #D7B9E4; border-right:1px solid #D7B9E4; width:100px; text-align: center;">번호</th>
						<th style="background-color: #D7B9E4;  border-right:2px solid #D7B9E4; width: 400px; text-align: center;">제목</th>
						<th style="background-color: #D7B9E4;  border-right:2px solid #D7B9E4; width:150px;  text-align: center;">작성자</th>
						<th style="background-color: #D7B9E4;  border-right:2px solid #D7B9E4; width:300px;  text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++) {
					%>
						<tr>
							<td style="border-left:2px solid #D7B9E4;border-right:2px solid #D7B9E4;"><%= list.get(i).getBbsID() %></td>
							<td style="border-right:2px solid #D7B9E4;"><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></a></td>
							<td style="border-right:2px solid #D7B9E4;"><%= list.get(i).getUserID() %></td>
							<td style="border-right:2px solid #D7B9E4;"><%= list.get(i).getBbsDate().substring(0,11)+list.get(i).getBbsDate().substring(11,13)+"시"+list.get(i).getBbsDate().substring(14,16)+"분" %></td>
						</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
		<div>
			<%
				if(pageNumber != 1){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				}if(bbsDAO.nextPage(pageNumber+1)){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
				<a href="write.jsp" class="btn btn-primary pull-right" style="float:right;">글쓰기</a>
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