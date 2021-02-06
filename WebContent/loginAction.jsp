<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> <!-- 우리가 만든 클래스 사용 -->
<%@ page import="java.io.PrintWriter" %> <!-- javascript 문장을 사용하기 위함 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8로 만듦 -->
<jsp:useBean id="user" class="user.User" scope="page"/> <!-- 빈즈를 사용한다고 알려줌 / page: 현재 페이지 안에서만 빈즈가 사용될 수 있도록 -->
<jsp:setProperty property="userID" name="user"/> <!-- input name = "userID"로 넘어온 userID를 받아서 한명의 사용자의 userID에 넣어준다. -->
<jsp:setProperty property="userPassword" name="user"/>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>>JSP 게시판 웹 사이트</title>
	</head>
	<body>
		<%
			String userID = null;
			if(session.getAttribute("userID")!=null){
				userID=(String) session.getAttribute("userID");
			}
			if(userID !=null){
				PrintWriter script = response.getWriter();
				   script.println("<script>");
				   script.println("alert('이미 로그인이 되어있습니다.')");
				   script.println("location.href = 'main.jsp'");
				   script.println("</script>");
			}
		
			UserDAO userDAO = new UserDAO();
			int result = userDAO.login(user.getUserID(), user.getUserPassword()); //넘어온 값이 login 값에 들어가 실행됨.
			if(result == 1){
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
			else if(result == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 틀립니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else if(result == -2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('오류가 발생했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		%>
	</body>
</html>