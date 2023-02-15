<%@page import="dto.MemberDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	MemberDto login = (MemberDto)session.getAttribute("login");
	if(login == null){
		%>
		<script>
			alert('로그인 해주세요');
			location.href = "login.jsp";
		</script>
		<% 
	}

%>
     
    
<%

int seq = Integer.parseInt(request.getParameter("seq"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	BbsDao dao = BbsDao.getInstance();
	BbsDto dto = dao.getBbs(seq);

%>

<h2>글 수정</h2>
<div align="center">
<form action="bbsupdateAf" method="post">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">

<table border="1">
<col width="200"><col width="500">
<tr>
	<th>작성자</th>
	<td><%=dto.getId() %></td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" value="<%=dto.getTitle() %>">
	</td>
</tr>
<tr>
	<th>작성일</th>
	<td>
		<%=dto.getWdate() %>
	</td>
</tr>
<tr>
	<th>조회수</th>
	<td>
		<%=dto.getReadcount() %>
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="50"><%=dto.getContent() %></textarea>
	</td>
</tr>

</table>
</form>
</div>


</body>
</html>