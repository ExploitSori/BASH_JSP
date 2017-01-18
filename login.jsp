<html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.sql.*" %>                    

<%
Connection conn = null;                                        
PreparedStatement pstmt = null;
String userid = request.getParameter("id");//form에서 id받아옴
String userpw = request.getParameter("pw");//pw받아옴


try{

String url = "jdbc:mysql://localhost:3306/sori";//jdbc생성 정보 jdbc:db종류:ip:포트3306은 mysql포트/디비이름
String id = "root";//db계정정보 id
String pw = "apmsetup";//db계정정보 pw


Class.forName("com.mysql.jdbc.Driver");//jdbc드라이버 생성
conn=DriverManager.getConnection(url,id,pw);  //db연결



//String sql = "insert into address(no,id,pw) values("+num+",'"+insertid+"','"+insertpw+"');";
String selectSql="select * from jsp where id='"+userid+"' and pw='"+userpw+"';";//쿼리
//pstmt = conn.createStatement();
//Statement st = conn.createStatement();
    
//pstmt.executeUpdate(); //-> insert or delete 할 때    
//ResultSet rs = st.executeQuery(selectSql);//select 할 때

        Statement stmt = conn.createStatement();//db 세션열기 
        ResultSet rs = stmt.executeQuery(selectSql);//쿼리 전송
//결과값은 ResultSet이라는 객체 안에 담김






while(rs.next()){//rs객체에서 결과값 조회
	int selectNo = rs.getInt("no");//객체니까 형변환
	String selectId = rs.getString("id");//형변환
	String selectPw = rs.getString("pw");//변환

	session.setAttribute("no",selectNo);//사이트 세션 등록 세션
	session.setAttribute("id",selectId);//세션
	session.setAttribute("pw",selectPw);//세션
}
}


catch(Exception e){//예외가 발생하였을 경우 에러창 출력
	out.println("<script>alert('알 수 없는 오류가 발생했습니다.');</script>");
}
finally{                                                            
if(pstmt != null) //세션닫고 
try{pstmt.close();}
catch(SQLException sqle){}          

if(conn != null) //디비닫고
try{conn.close();}
catch(SQLException sqle){}            
}
%>
no : <% out.println(session.getAttribute("no")); %><!-- 세션에서 정보 출력 -->
<br>
id : <% out.println(session.getAttribute("id")); %>
<br>
pw : <% out.println(session.getAttribute("pw")); %>
<br>

</html>
