<%@ page import="javax.xml.parsers.*,org.w3c.dom.*" %>
<head>
<title>ACMS</title>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="Styles/layout.css" type="text/css" />
<style>
a.ex1:hover, a.ex1:active {color: orangered; background-color: white !important;  }
   </style>
</head>
<body>
<jsp:include page="include/top.jsp"></jsp:include>
<div class="wrapper col2">
  <div id="intro">
 <%
 try{
 String XmlPath = "data.xml";
 %>
 <%!
 Document doc;
 String getXMLValue(String name) {
 NodeList nlist=doc.getElementsByTagName(name);
 String value = nlist.item(0).getFirstChild().getNodeValue();
 return value;
 }
 %>
 <%
 String appPath = application.getRealPath("/");
 DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
 DocumentBuilder db=dbf.newDocumentBuilder();
 doc=db.parse(appPath + XmlPath);
 String TitleVar    = getXMLValue("title");
 String dVar    = getXMLValue("d");
 String EVar    = getXMLValue("e");

 String BVar    = getXMLValue("b");
 String GVar    = getXMLValue("g");
  String HVar    = getXMLValue("h");
   String IVar    = getXMLValue("i");
    String JVar    = getXMLValue("j");
 String UrlVar    = getXMLValue("url");
 %>
  <h1 style="text-align:center;"><strong><%=TitleVar%></strong></h1>
 <p ><%=dVar%></p>
 <p ><%=EVar%></p>
 <p><%=BVar%></p>
 <ul>
 <li><center><%=GVar%></center></li>
  <li><center><%=HVar%></center></li>
   <li><center><%=IVar%></center></li>
    <li><center><%=JVar%></center></li>
    </ul>
    
 <center><a class="ex1" href="<%=UrlVar%>">Visit Our Site</a></center>

 <%
 }catch(Exception e){
 }%>
 </div>
 </div>
 <jsp:include page="include/bottom.jsp"></jsp:include>
 </body>