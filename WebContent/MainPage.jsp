<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="one.DB" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@1,900&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>PhoneBook</title>
<style>
*{
font-family: 'Lato', sans-serif;
}
input{
outline:none;
}
td{
padding:10px 0px;
}
th{
font-size:25px;
text-decoration:underline;
}
tr{
border-bottom:1px dotted black;
}
</style>



</head>
<body style="background-color: rgb(18,18,19);
background-image: linear-gradient(45deg, #101010 0%, #9a6b97 47%, #dcdad7 100%);
background-repeat: no-repeat;
background-size:1920px 1080px;
">
<form action="MainPage.jsp" method="post">
<!-- Database Connection -->
<%!Connection con=DB.getCon(); %>

<h1 style="margin:20px;font-family: 'Lato', sans-serif;">Phone<span style="color:white">Book</span></h1>
<hr style="border-style:dotted;border-color:white">

<%!String name=null,number=null,address=null;%>
<%
name=request.getParameter("name");
number=request.getParameter("number");
address=request.getParameter("address");
%>
<%!
public class contact{
int id;
String name=null,number=null,address=null;
contact(int idd,String nam,String num,String add){
id=idd;
name=nam;
number=num;
address=add;
}
}
%>

<%!
List<contact> phonebook = new ArrayList<contact>();
static int id=1;
public void load(){
phonebook.clear();
	try{
		PreparedStatement ps1=con.prepareStatement("Select * from phonebook");
	ResultSet rs=ps1.executeQuery();
	while(rs.next()){
	phonebook.add(new contact(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
	}
	
	if(phonebook.size()>=1){
	id=phonebook.get(phonebook.size()-1).id+1;
	}else{
		id=1;
	}
	}catch(Exception e){
		System.out.println(e);
	}
}
%>
<%load(); %>
<div style="margin:0px 20px;width:'100%'">
<span style="font-size:30px">New Contact :</span>
<input style="margin:0px 50px 0px 20px;width:300px;height:40px;border-radius:20px;border:none;padding:0px 20px" placeholder="Enter Name" name="name">
<input style="margin:0px 50px;width:300px;height:40px;border-radius:20px;border:none;padding:0px 20px" placeholder="Enter Contact Number"  type="number" name="number">
<input style="margin:0px 50px;width:550px;height:40px;border-radius:20px;border:none;padding:0px 20px" placeholder="Enter Address"  name="address">
<button name="hello" onclick="<%add(name,number,address); %>" id="b11" style="width:100px;height:40px;color:white;background-color:black;border:none;border-radius:20px">submit</button>
<hr style="border-style:dotted;border-color:white">

	
<h2>All Contacts :</h2>
<div style="height:650px;width:'100%';background-color:white;margin:20px 0px;padding:30px;border-radius:20px">
<table style="width:1500px;text-align:left">
<tr><th>S. No.</th><th>Name</th><th>Contact No.</th><th>Address</th></tr>
<%for(contact i:phonebook){ %>
<tr><td><%=i.id %></td><td><%=i.name %></td><td><%=i.number %></td><td><%=i.address %></td></tr>
<%} %>




</table>
 <%!
 public void add(String name,String number,String address){
	 
	 try{
	 PreparedStatement ps;
	 ps=con.prepareStatement("insert into phonebook values (?,?,?,?)");
	 ps.setInt(1, id);
	 ps.setString(2, name);
	 ps.setString(3, number);
	 ps.setString(4, address);
	 if(ps.executeUpdate()==1){
		id++; 
	 }
	 }catch(Exception e){
		 
	 }
	 name=number=address=null;
	 load();
 }
 %>
</div>
</div>
</form>
</body>
</html>