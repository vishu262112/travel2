
<%@page import="com.mphasis.travel.model.TravelUser"%>
<%@page import="com.mphasis.travel.model.Travel"%>
<%@page import="java.util.List"%>
<%@page import="com.mphasis.travel.model.TravelDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> 
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script>
			$(document).ready(function(){
				$("#travelId").change(function(){
						var travelId=$(this).val();
					$ajax({url: "retrieve?travelId="+travelId,success:function(result){
						var travel=$.parseJSON(result);
						$("#placeName").val(travel.placeName);
						$("#dateOfJourney").val(travel.dateOfJourney);
						$("#pricePackage").val(travel.pricePackage);
						var imgStr="data:image/jpg;base64,"+travel.placeImage;
						$("#placeImage").attr("src",imgStr);
							}});
					});
				var a=document.getElementById('a');
				var b=document.getElementById('b');
				a.addEventListener('click',function(){
				    a.style.display="none";
				    b.style.display="none";
				    document.getElementById('a_form').style.display="";
				});
				b.addEventListener('click',function(){
				    a.style.display="none";
				    b.style.display="none";
				    document.getElementById('b_form').style.display="";
				});


				
				});
</script>
	
<style type="text/css">
.contact-form .form-field {
  position: relative;
  margin: 32px 0;
}
.contact-form .input-text {
  display: block;
  width: 100%;
  height: 36px;
  border-width: 0 0 2px 0;
  border-color: #5543ca;
  font-size: 18px;
  line-height: 26px;
  font-weight: 400;
}
.contact-form .input-text:focus {
  outline: none;
  }
  
  
  .contact-form .input-text:focus + .label,
.contact-form .input-text.not-empty + .label {
  -webkit-transform: translateY(-24px);
          transform: translateY(-24px);
}
.contact-form .label {
  position: absolute;
  left: 20px;
  bottom: 11px;
  font-size: 18px;
  line-height: 26px;
  font-weight: 400;
  color: #5543ca;
  cursor: text;
  transition: -webkit-transform .2s ease-in-out;
  transition: transform .2s ease-in-out;
  transition: transform .2s ease-in-out, 
  -webkit-transform .2s ease-in-out;
}

.contact-form .submit-btn {
  display: inline-block;
  background-color: #000;
   background-image: linear-gradient(125deg,#009400,#064497);
  color: #fff;
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 16px;
  padding: 8px 16px;
  border: none;
  width:100px;
  cursor: pointer;
}

.contact-form .submit-btn1 {
  display: inline-block;
  background-color: #000;
   background-image: linear-gradient(125deg,#FF4500,#064497);
  color: #fff;
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 16px;
  padding: 8px 16px;
  border: none;
  width:100px;
  cursor: pointer;
}

.contact-form .submit-btn2 {
  display: inline-block;
  background-color: #000;
   background-image: linear-gradient(125deg,#ff0000,#064497);
  color: #fff;
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 16px;
  padding: 8px 16px;
  border: none;
  width:100px;
  cursor: pointer;
}

.webkit-input-placeholder { /* Chrome/Opera/Safari */

  color: white;

}

</style>

</head>
<body>
<%-- <%

	if(session.getAttribute("user")==null)
	{
		out.println("YOu have not logged in. Click<a href=login.jsp> here </a>to go to login page");
		return;
	}
	TravelUser user=(TravelUser)session.getAttribute("user");
	out.println("Welcome "+user.getUserName()+"... You are an "+user.getRole());
	if(!user.getRole().equals("admin"))
	{
		out.println("\n<br/>Sorry. Only admin can access this page. click<a href=Login.jsp> here </a>to go back to login page");
		return;
	}
%> --%>

<jsp:useBean id="tdao" class="com.mphasis.travel.model.TravelDaoImpl" />
<%-- <%
	List<Travel> travelList= tdao.read();
	session.setAttribute("travelList", travelList);
%> --%>
<div class="jumbotron">
	<h1><center>Travel Registration form</center></h1>
</div>s
<div class="row">
	<div class="col-md-4">
	</div>
	<div class="col-md-4">
		<%-- <form method="POST" action="travel" enctype="multipart/form-data">
	
			Travel Id: 
			<input type="number" name="travelId" class="form-control" value="${param.travelId } " list="tid" />
			<datalist id="tid">
				<option>Choose..</option>
				<c:forEach var="a" items="${travelList }">
					<option value="${a.travelId }">${a.travelId }</option>
				
				 </c:forEach>
			</datalist>
			Place Name:
			<input type="text" id="placeName"name="placeName" class="form-control" value="${param.placeName }" />
			
			Date Of Journey:
			<input type="date" id="dateOfJourney" name="dateOfJourney" class="form-control" value="${param.dateOfJourney }" />
			Package:
			<input type="number" id="pricePackage" name="pricePackage" class="form-control" value="${param.pricePackage }" >
			Picture:
			<input type="file" name="placeImage" />
			<br/>
			<input type=submit class="btn btn-success" name="btn" value="Add" />&nbsp;
			<input type=submit class="btn btn-info" name="btn" value="Modify" />&nbsp;
			<input type=submit class="btn btn-warning" name="btn" value="Delete" />&nbsp;
			
		</form> --%>
		
		
		
		<div class="w3-panel" style="width:30%">
  <button  id="a" class="w3-button w3-block w3-red w3-right-align">EDIT</button>
  <button id="b" style="display:none;"></button>
</div>
	
	

<form id="b_form" name="b" style="display:none;">
    <input name="b_input" value="B: type here"/>
    <input type="submit"/>
</form>
		
		
   <form class="contact-form row " id="a_form" name="a" style="display:none;">
   
   <div class="form-field col-lg-6">
<!--          <input id="name" class="input-text js-input" type="text" name="travelId"required>
 -->         
         <input type="number" name="travelId" class="input-text js-input" value="${param.travelId } " list="tid" />
			<datalist id="tid">
				<option>Choose..</option>
				<c:forEach var="a" items="${travelList }">
					<option value="${a.travelId }">${a.travelId }</option>
				
				 </c:forEach>
			</datalist>
         
         
         <label class="label" for="name">TRAVEL ID</label>
      </div>
      <div class="form-field col-lg-6">
         <input id="name" class="input-text js-input" type="text" name="placeName"required>
         <label class="label" for="name">PLACE NAME</label>
      </div>
      
      <div class="form-field col-lg-6 webkit-input-placeholder">
        <input id="company" class="input-text js-input" type="date"name="dateOfJourney" required>
         <label class="label" for="company">DATE OF JOURNEY</label> 
         
         
      </div>
       <div class="form-field col-lg-6 ">
       
       <label class="label" for="phone">PACKAGE</label>
         <input id="phone" class="input-text js-input" type="number" name="package" required>
         
      </div>
    
    <div class="form-field col-lg-4">
       <label class="label" for="message">PICTURE</label>  
    </div>
       <div class="form-field col-lg-8 ">
       
 			<input id="message" class="input-text js-input" type="file" name="placeImage" required>         
      </div>
     
       
         
         
     
      <div class="form-field col-lg-12">
         <input class="submit-btn" type="submit" name = "btn" value="ADD">
         <input class="submit-btn1" type="submit"  name = "btn" value="MODIFY">
         <input class="submit-btn2" type="submit"  name = "btn" value="DELETE">
      </div>
   </form>
</section>
		
		
	</div>
		<div class="col-md-4">
		<img id="placeImage" width="100" height="100" />
	</div>
</div>
<div class="row">
	<div class="col-md-3">
	</div>
	<div class="col-md-6">
		<table class="table table-striped table-bordered table-hover">
		<thead>
			<th>Travel Id</th><th>Place Name</th>
			<th>Date of Journey</th><th>Package</th><th>Picture</th>
			<th></th>
		</thead>
		<c:forEach var="a" items="${travelList }">
		<form action="travel2.jsp">
			<tr>
				<td>
					<input type=hidden name="travelId" value="${a.travelId }" />
					${a.travelId }
				</td>
				<td>
					<input type=hidden name="placeName" value="${a.placeName }" />
					${a.placeName }
				</td>
				
				<td>
					<input type=hidden name="dateOfJourney" value="${a.dateOfJourney2 }" />
					${a.dateOfJourney2}
				</td>
				<td>
					<input type=hidden name="pricePackage" value="${a.pricePackage }" />
					${a.pricePackage }
				</td>
				<td>
					<img id="img${a.travelId }" width=80 height=80 src="data:image/jpg;base64,${a.placeImage1}" />
				</td>
				<td>
					<input type=submit value="Choose" class="btn btn-info" />
				</td>				
			</tr>
		</form>
		</c:forEach>
		</table>
	</div>
	<div class="col-md-3">
	</div>
</div>
</body>
</html>