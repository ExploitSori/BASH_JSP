<%@ page contentType="text/html; charset=utf-8" %>
<%
String name = request.getParameter("name");
String[] a={"a","b","c"};
for(String s:a){
	if(s.equals(name)){
		out.println("맞음");
		}

	else{
		out.println("ffff"+"<br>");
	}

	//out.println(s+"="+name+"<br>");
	//out.println(s.equals(name)+"<br>");
	
}

//tomcat session request

//out.println((String)session.getAttribute("nick"));

%>
