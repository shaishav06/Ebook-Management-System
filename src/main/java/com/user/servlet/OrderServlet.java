package com.user.servlet;

import java.io.IOException;

import java.util.List;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.entity.Cart;
import com.DAO.CartDAOImple;
import com.DAO.BookOrderImple;
import com.entity.Book_Order;


@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session=req.getSession();
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String paymentType=req.getParameter("payment");
			
			String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
			//System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType);
			
			CartDAOImple dao=new CartDAOImple(DBConnect.getconn());
			
			List<Cart> blist=dao.getBookByUser(id);
			
			BookOrderImple dao2=new BookOrderImple(DBConnect.getconn());
			
			
			Book_Order o=null;
			
			ArrayList<Book_Order> orderList=new ArrayList<Book_Order>();
			Random r=new Random();
			for(Cart c:blist)
			{
				o=new Book_Order();
				o.setOrderId("BOOK-ORD-00"+r.nextInt(1000));
				o.setUsername(name);
				o.setEmail(email);
				o.setPhno(phno);
				o.setFullAdd(fullAdd);
				o.setBookName(c.getBookName());
				o.setAuthor(c.getAuthor());
				o.setPrice(c.getPrice()+"");
				o.setPaymentType(paymentType);
				
				orderList.add(o);
				
			}
			
			if("noselect".equals(paymentType)) {
				session.setAttribute("failMsg", "choose payment method");
				resp.sendRedirect("cart.jsp");
			}else {
				boolean f=dao2.saveOrder(orderList);
				if(f) {
					resp.sendRedirect("order_success.jsp");
				}else {
					session.setAttribute("failMsg", "Order Failed");
					resp.sendRedirect("cart.jsp");
				}
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}


}
