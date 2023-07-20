<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImple"%>
<%@page import="com.entity.BookDetailes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Book</title>
<style>


.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
<%@include file="all_component/allCss.jsp" %>
</head>
<body>
<%@include file="all_component/navbar.jsp"%>
<div class="container fluid">
<div class="row p-3">
<%
		String ch=request.getParameter("ch");
		BookDAOImple dao2=new BookDAOImple(DBConnect.getconn());
		List<BookDetailes> list2=dao2.getBookBySearch(ch);
		for(BookDetailes b:list2)
		{%>
		
		<div class="col-md-3 ">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 100px; height: 150px;" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>
						<%
						if(b.getBookCategory().equals("old"))
						{%>
						Categories:<%=b.getBookCategory() %></p>
							<div class="row ">
							
							 <a href=""
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
							
						<%}else{%>
							
							Categories:<%=b.getBookCategory() %></p>
							<div class="row ">
							<a href="" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-shopping"></i>Add Cart</a> <a href=""
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-0.5"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%}
						%>
						
					</div>
				</div>
			</div>
			
			
		<%}
		%>
			
		</div>	
		</div>

</body>
</html>