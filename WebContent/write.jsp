 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>암호응용</title>

  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/business-frontpage.css" rel="stylesheet">

</head>

<body>
<%
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID = (String) session.getAttribute("userID");
	}
%>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a href="index.jsp" class="navbar-brand" href="#">Bulletin Board of Encryption</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item">
            <a href="bbs.jsp" class="nav-link" href="#">게시판</a>
          </li>
<%
	if(userID == null){
%>
<li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="ture" aria-expanded="false">로그인</a>
            <div class="dropdown-menu" aria-labelledy="navbarDropdown">
              <a href="login.jsp" class="dropdown-item" href="#">로그인</a>
              <a href="join.jsp" class="dropdwn-item" href="#">회원가입</a>
              <div class="dropdown-divider"></div>
<%
	}else{
%>
<ul class="nav navbar-nav">
<li><a href="logoutAction.jsp">로그아웃</a></li>
</ul>
<%
	}
%>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>
	  <div class="container">
                      <div class="row">
                      <form method="post" action="writeAction.jsp">
                       <table class="table table-stripted" style="text-align: center; border: 1px solid #dddddd">
                          <thead>
                            <tr>
                              <th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>

                              </tr>
                              </thead>
                              <tbody>
                              <tr>
                                <td><input size="150" type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
                                </tr>
                                <tr>
                                <td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
                                </tr>
                                 </tbody>
                                 </table>
                                 <input type="submit" class="btn btn-primary pull-right" value="제출">
                      </form>


                                    </div>
                                    </div>
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>
