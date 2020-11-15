<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="bbs.Bbs" %>
    <%@ page import="bbs.BbsDAO" %>
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
	int  bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID==0){
		PrintWriter script= response.getWriter();
		   script.println("<script>");
		   script.println("alert('유효하지 않은 글입니다.')");
		   script.println("location.href = 'bbs.jsp'");
		   script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
%>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a href="index.jsp" class="navbar-brand" href="#">게시판</a>
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
                       <table class="table table-stripted" style="text-align: center; border: 1px solid #dddddd">
                          <thead>
                            <tr>
                              <th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기 양식</th>
                              
                              </tr>
                              </thead>
                              <tbody>
                             <tr>
                             <td style="width: 20%;">글 제목</td>
                             <td colspan="2"><%= bbs.getBbsTitle() %></td>
                             </tr>
                             <tr>
                             <td>작성자</td>
                             <td colspan="2"><%=bbs.getUserID() %></td>
                             </tr>
                             <tr>
                             <td>작성일자</td>
                             <td colspan="2"><%=bbs.getBbsDate().substring(0,11)+bbs.getBbsDate().substring(11,13)+"시"+bbs.getBbsDate().substring(14,16)+"분"%></td>
                             </tr>
                             <tr>
                             <td>내용</td>
                             <%
                             	if(userID != null && userID.equals(bbs.getUserID())){
                             %>
                             <td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%></td>
                             <%
                             	} else {
                             %>
                             <%
                             	}
                             %>
                             </tr>
                             </tbody>
                             </table>
                                 <a href="bbs.jsp" class="btn btn-primary">목록</a>
                                 <%
                                 	if(userID != null && userID.equals(bbs.getUserID())){
                                 		%>
                                 		<a href="update.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">수정</a>
                                 		<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-primary">삭제</a>
                                 		<%
                                 	}
                                 		%>
                                 	
                                  <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
                                    </div>
                                    </div>
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>