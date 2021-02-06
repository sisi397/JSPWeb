<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/business-frontpage.css" rel="stylesheet">
	<title> 게시판 웹 사이트</title>

	<script type="text/javascript">
	    function safetyPasswordPattern(str) {
	        var pass = str.value;
	        var message = "";
	        var color = "";
	        var checkPoint = 0;
	
	        if(pass.length) {
	            if(pass.length < 8 || pass.length > 16) {
	                color = "#FF0000";
	            }else {
	                var pattern1 = /[0-9]/;  
	                if(pattern1.test(pass) == false) {
	                    checkPoint = checkPoint + 1;
	                }
	                var pattern2 = /[a-z]/;
	                if(pattern2.test(pass) == false) {
	                    checkPoint = checkPoint + 1;
	                }
	                var pattern3 = /[A-Z]/;
	                if(pattern3.test(pass) == false) {
	                    checkPoint = checkPoint + 1;
	                }
	                var pattern4 = /[~!@#$%^&*()_+|<>?:{}]/;  
	                if(pattern4.test(pass) == false) {
	                    checkPoint = checkPoint + 1;
	                }
	                if(checkPoint >= 3) {
	                    color = "#FF0000";
	                } else if(checkPoint == 2) {
	                    color = "#FFBB00";
	                } else if(checkPoint == 1&&checkPoint==0) {
	                    color = "#0000CD";
	                } 
	            }
	        }else {
	            color = "#000000";
	        }
	        document.getElementById("makyText").innerHTML = message;
	        document.getElementById("makyText").style.color = color;
	    }
	</script>
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
 
	<!-- Page Header -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-5" style="margin:0px auto;">
			<div class="jumbotron" style="padding-top: 20px; margin-top: 110px;">
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align: center;">회원가입 화 면</h3><br>
					<div class="form-group">
						<input type="text" class="form-control"  name="userID" placeholder="아 이 디" maxlength="20">
					</div><br>
					<div class="form-group">
						<input type="password" class="form-control" value="" id="makyText" onKeyup="safetyPasswordPattern(this);" name="userPassword"  placeholder="비 밀 번 호" maxlength="20" title=chkPwd(userPassword)>
					</div>
					<p>보안성 : <span style="color:#FF0000"> 낮음</span><span style="color:#FFBB00">보통</span><span style="color:#000000">높음</span></p><br>
					<div class="form-group">
						<input type="text" class="form-control" name="userName"  placeholder="이름" maxlength="20">
					</div><br>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"> <!-- active는 기본적으로 선택된것을 의미 -->
								<input type="radio" name="userGender" autocomplete="off" value="남자">남자
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="userGender" autocomplete="off" value="여자">여자
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="50">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
			</div>
			<div class="col-lg-4"></div>
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