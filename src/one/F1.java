package one;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class F1 {
public void init() {
	
}
protected void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException{
PrintWriter pw=res.getWriter();
pw.write("hello");

RequestDispatcher rd=req.getRequestDispatcher("MainPage.jsp");
rd.include(req, res);
}
	
public void destroy() {
		
	}
}
