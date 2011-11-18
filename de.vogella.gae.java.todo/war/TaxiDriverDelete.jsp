<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="de.vogella.gae.java.todo.model.TaxiRequest" %>
<%@ page import="de.vogella.gae.java.todo.model.TaxiDriver" %>
<%@ page import="de.vogella.gae.java.todo.dao.Dao" %>

<!DOCTYPE html>


<%@page import="java.util.ArrayList"%>

<html>
	<head>
		<title>Taxi Driver</title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		  <meta charset="utf-8"> 
	</head>
	<body>
<%
Dao dao = Dao.INSTANCE;




List<TaxiDriver> drivers = new ArrayList<TaxiDriver>();
           
drivers = dao.listAllTaxiDriver();
    
%>
	<div style="width: 100%;">
		<div class="line"></div>
		<div class="topLine">
			<div style="float: left;"><img src="images/todo.png" /></div>
			<div style="float: left;" class="headline">Taxi Requests</div>
			<div style="float: right;">&nbsp;</div>
		</div>
	</div>

<div style="clear: both;"/>	
You have a total number of <%= drivers.size() %>  Taxi Drivers.


			
<table>
  <tr>
      <th>ID</th>
      <th>Login Name</th>
      <th>Login Pin</th>
      <th>Full Name</th>
      <th>Cab Name</th>
      <th>Phone Number</th>
      <th>Current Latitude</th>
      <th>Current Longitude</th>
      <th>Max Pickup Distance</th>
      <th>Max Drop Off Distance</th>
      <th>Preferred Payment</th>
      <th>Available</th>
      <th>Authenticate</th>
            
    </tr>

<% for (TaxiDriver driver : drivers) {%>
<tr> 
<td>
<%=driver.getId()%>
</td>
<td>
<%=driver.getLoginName()%>
</td>
<td>
<%=driver.getLoginPin()%>
</td>>
<td>
<%=driver.getFullName()%>
</td>
<td>
<%=driver.getCabName()%>
</td>
<td>
<%=driver.getPhoneNumber()%>
</td>
<td>
<%=driver.getCurrentLatitude()%>
</td>
<td>
<%=driver.getCurrentLongitude()%>
</td>
<td>
<%=driver.getMaxPickupDistance()%>
</td>
<td>
<%=driver.getMaxDropOffDistance()%>
</td>
<td>
<%=driver.getPreferredPayment()%>
</td>
<td>
<%=driver.getIsAvailable()%>
</td>
<td>
<%=driver.isAuth()%>
</td>
<%}
%>
</tr> 

</table>


<hr />

<div class="main">

<div class="headline">Taxi Driver Adding/Updating</div>



<form action="/remove" method="post" accept-charset="utf-8">
	<table>
		
	<tr>
		<td valign="top"><label for="regID">Registration ID</label></td>
		<td><input type="text" name="regID" id="regID" size="65" /></td>
	</tr>
	
	<tr>
			<td colspan="2" align="right"><input type="submit" value="Delete Driver"/></td>
		</tr>
	</table>
</form>




</div>
</body>
</html>

