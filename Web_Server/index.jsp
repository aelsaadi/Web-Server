<%-- 
    Document   : index
    Created on : Nov 4, 2019, 1:32:34 PM
    Author     : aelsa
--%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.io.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>JSP Page connecting to Oracle 12c Table!</h1>
        
        <% 
            String url = "jdbc:oracle:thin:@129.7.240.3:1521:orcl";
            
            //Establish Connection
            Connection conn = DriverManager.getConnection(url, "ARLSAADI","ARLSAADI#");
            
            Statement statement = conn.createStatement();
            String query = "SELECT p.ProductID, p.ProductName, SUM(o.OrderedQuantity) FROM Product p, OrderLine o WHERE p.ProductID = o.ProductID GROUP BY p.ProductID, p.ProductName ORDER BY p.ProductID";
            ResultSet resultset = statement.executeQuery(query);
        %>
        
        <TABLE BORDER ="1" BGCOLOR ="CCFFF" width='50%' cellspacing='1' cellpading='0' bordercolor='black' border='1'>
            <TR>
                <TH bgcolor='#DAA520'> <font size='2'/>ProductID</TH>
                <TH bgcolor='#DAA520'> <font size='2'/>ProductName</TH>
                <TH bgcolor='#DAA520'><font size='2'/>OrderedQuantity</TH>
            </TR>
            <% while (resultset.next()) {%>
            <TR>
                <TD> <font size='2'/><center><%= resultset.getString(1)%></center></TD>
                <TD> <font size='2'/><center><%= resultset.getString(2)%></center></TD>
                <TD> <font size='2'/><center><%= resultset.getString(3)%></center></TD>
            </TR>
            
            <% }%>
    </body>
</html>
