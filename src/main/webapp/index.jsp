<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImple"%>
<%@page import="com.entity.BookDetailes"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook</title>
<%@include file="all_component/allCss.jsp"%>

</head>

<style>
.back-img {
	background: url("img/b.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>

<body style="background-color: #f2f7f7;">
<%
User u=(User)session.getAttribute("userobj");
%>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img">
		<h2 class="text-center" style="color: #303f9f">EBook Management
			System</h2>
	</div>

	<!-- Start Recent Book -->

	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
		
		<%
		BookDAOImple dao2=new BookDAOImple(DBConnect.getconn());
		List<BookDetailes> list2=dao2.getRecentBooks();
		for(BookDetailes b:list2)
		{%>
		
		<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>
						<%
						if(b.getBookCategory().equals("Old"))
						{%>
						Categories:<%=b.getBookCategory() %></p>
							<div class="row ">
							
							 <a href="view_books.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
							
						<%}else{%>
							
							Categories:<%=b.getBookCategory() %></p>
							<div class="row ">
							
							<%
						if(u==null)
						{%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add Cart</a>
						<%}
						else{%>
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add Cart</a>
						<%}
						%>
							 <a href="view_books.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%}
						%>
						
					</div>
				</div>
			</div>
			
			
		<%}
		%>
			
			
			
		</div>
		<div class="text-center mt-1">

			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<!-- End Recent Books -->

	<hr>
	<!-- Start New Book -->

	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">
			
				<%
				BookDAOImple dao = new BookDAOImple(DBConnect.getconn());
				List<BookDetailes> list = dao.getNewBook();
				for (BookDetailes b : list) {
				%>
				<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto() %>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>Categories:<%=b.getBookCategory() %></p>
						<div class="row ">
						<%
						if(u==null)
						{%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add Cart</a>
						<%}
						else{%>
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-cart-shopping"></i>Add Cart</a>
						<%}
						%>
						
							 <a href="view_books.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			
	</div>
				<%
				}
				%>
				


</div>
	
		<div class="text-center mt-1">

			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<!-- End New Books -->
	<hr>

	<!-- Start Old Book -->

	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
		<%
				BookDAOImple dao3 = new BookDAOImple(DBConnect.getconn());
				List<BookDetailes> list3 = dao.getOldBooks();
				for (BookDetailes b : list3) {
				%>
				<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto() %>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>Categories:<%=b.getBookCategory() %></p>
						<div class="row ">
							 <a href="view_books.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			
	</div>
				<%
				}
				%>
				
			
		
		
		</div>
		<div class="text-center mt-1">

			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<!-- End Old Books -->

	<%@include file="all_component/footer.jsp"%>
</body>
</html>