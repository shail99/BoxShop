<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
   	import="edu.neu.cs5200.project.rest.client.*"
	import="edu.neu.cs5200.project.models.*"
	import="edu.neu.cs5200.project.dao.*"
	import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BOX SHOP an E-Commerce online Shopping Category Flat Bootstarp responsive Website Template| Register :: w3layouts</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="BOX SHOP Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<!-- start slider -->
<script src="js/responsiveslides.min.js"></script>
 <script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
  </script>
<!--end slider -->
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
				<script type="text/javascript">
			$(window).load(function() {
				$("#flexiselDemo").flexisel({
					visibleItems: 5,
					animationSpeed: 1000,
					autoPlay: true,
					autoPlaySpeed: 3000,    		
					pauseOnHover: true,
					enableResponsiveBreakpoints: true,
			    	responsiveBreakpoints: { 
			    		portrait: { 
			    			changePoint:480,
			    			visibleItems: 1
			    		}, 
			    		landscape: { 
			    			changePoint:640,
			    			visibleItems: 2
			    		},
			    		tablet: { 
			    			changePoint:768,
			    			visibleItems: 3
			    		}
			    	}
			    });
			    
			});
		</script>
		<script type="text/javascript" src="js/jquery.flexisel.js"></script>
</head>
<body>
	<%CartDao cdao = new CartDao();
	  UserDAO udao = new UserDAO();
	  Userbean bean = new Userbean();
	  Custinfo info = new Custinfo();
	  String action = request.getParameter("action");
	  String first = request.getParameter("first");
	  String last = request.getParameter("last");
	  String sex = request.getParameter("sex");
	  String address = request.getParameter("address");
	if(session.getAttribute("username")==null){
		response.sendRedirect("login.jsp");
	}
	else{
 	  bean.setUsername(session.getAttribute("username").toString());
	  bean = udao.getUname(bean);
	  if("submit".equals(action)){
		  info.setUsername(session.getAttribute("username").toString());
		  info.setFirstname(first);
		  info.setLastname(last);
		  info.setGender(sex);
		  info.setAddress(address);
		  udao.addCustInfo(session.getAttribute("username").toString(), info);%>
		  <script>alert("Profile Updated!")</script>
		  <%
	  }
}
	%>
	<!-- header-section-starts -->
	<div class="header">
		<div class="top-header">
<div class="wrap">
				<div class="header-left">
					<ul>
						 <% if(session.getAttribute("username") == null) 
							{ %>
						<li class="login">
							<i class="lock"></i>
							<a href="login.jsp">Login</a>|							
						</li>
						<%} %>
						<% if(session.getAttribute("username") != null) 
							{ %>
						<li class="login">
							<a href=# >Welcome <%= session.getAttribute( "username" ) %> | </a>
						</li>
						<%} %> 
					<li>
					 <% if(session.getAttribute("username") == null) 
							{ %>						
					<!-- <div class="sign-up-right"> -->
						<a href="login.jsp">Sign Up</a>
					<!-- </div> -->
					<%} else {%>
					<!-- <div class="sign-up-right"> -->
						<a href="logout.jsp">Logout</a>
					<!-- </div> -->
					<%} %>
					</li>
					</ul>		
						
					</ul>
				</div>
				<div class="header-right">
					<ul>					
						 <li>
							<i class="user"></i>
							<a href="register.jsp">My Account</a>
						</li>						
						 <% if(session.getAttribute("username") != null) 
							{ %>
						<li>						
							<a href="myorders.jsp">My Orders</a>						
						</li>
						<li>						
							<a href="wishlist.jsp">My WishList</a>						
						</li>
						<%} %>				
						<li>
							<i class="cart"></i>
							<% if(session.getAttribute("username") != null) 
							{ %>
							<a href="viewcart.jsp">Shopping Cart</a><%} else {%>
							<a href="login.jsp">Shopping Cart</a><%} %>
						</li>
						<li class="last">
						 <% if(session.getAttribute("username") == null) 
							{ %>0
							<% } else {%> <%=cdao.findNoOfItems(session.getAttribute("username").toString()) %>
							<%} %>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="wrap">
			<div class="header-bottom">
				<div class="logo">
					<a href="index.jsp"><img src="images/logo.jpg" class="img-responsive" alt="" /></a>
				</div>
				<div class="search">
					<div class="search2">
					  <form>
						<input type="submit" value="">
						 <input type="text" value="Search for a product, category or brand" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search for a product, category or brand';}"/>
					  </form>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- header-section-ends -->
	<div class="wrap">
		<div class="navigation-strip">
			<h4>Most Popular<i class="arrow"></i></h4>
			<div class="top-menu">
				<!-- start header menu -->
		<ul class="megamenu skyblue">
			<li><a class="color1" href="#">mobiles</a>		
			</li>
			<li class="grid"><a class="color2" href="#">tablets</a>
				</li>
			<li class="grid"><a class="color4" href="#">laptops</a>				
				</li>				
				<li><a class="color5" href="#">cameras</a>
				</li>
				<li><a class="color6" href="#">watches</a>
				</li>
				<li><a class="color8" href="#">eBooks</a>
				</li>
				<li><a class="color9" href="#">T-shirts</a>				
				</li>
				<li><a class="color5" href="#">sarees</a>
				</li>
				<li><a class="color1" href="#">jeans</a>
				</li>
				<li><a class="color10" href="#">perfumes</a>			
				</li>
				<li><a class="color2" href="#">sofas</a>
				</li>
				<li><a class="color6" href="#">sunglasses</a>
				</li>
		 </ul>
			</div>
		<div class="clearfix"></div>
		</div>
		<!-- start registration -->
		<section id="main">
	<div class="content">
		<div class="pag-nav">
			<ul class="p-list">
				<li><a href="index.jsp"></a></li>
				<li class="act">&nbsp;</li>
			</ul>
		</div>
		<div class="coats">
			<h3 class="c-head">my profile</h3>
			<p></p>
		</div>
		<div class="register">
	  	  <form action="register.jsp">
			 <div class="register-top-grid">
				<h3>PERSONAL INFORMATION</h3>
				 <div>
					<span>First Name</span>
					<input name="first" type="text" <%if(bean.getCustinfo()!=null){ %> value=<%=bean.getCustinfo().getFirstname() %>
													<%} else { %> value="" <%} %>> 
				 </div>
				 <div>
					<span>Last Name</span>
					<input name="last" type="text" <%if(bean.getCustinfo()!=null){ %> value=<%=bean.getCustinfo().getLastname() %>
													<%} else { %> value="" <%} %>> 
				 </div>
				 <div>
					 <span>Email Address</span>
					 <input name="email" type="text" value="<%=bean.getEmailId() %>" readonly> 
				 </div>
				 <div>
				 <span>Gender</span>
				 <input type="radio" name="sex" value="male" checked>Male
					<input type="radio" name="sex" value="female">Female
				</div>
				  <div class="clearfix"></div>
				  </div>
				  
				 </div>
				 
				  <div class="clearfix"></div>
			     <div class="register-bottom-grid">
					    <h3>ADDRESS INFORMATION</h3>
						 <div>
							<span>Mailing Address</span>
							<textarea name="address" rows="3" cols="100">
							<%if(bean.getCustinfo()!=null){ %> <%=bean.getCustinfo().getAddress() %>
													<%} else { %>  <%} %>
							</textarea>
						 </div>
				 </div>
			<div class="clearfix"> </div>
			<div class="register-but">
				   <input name="action" type="submit" value="submit">
				   <div class="clearfix"> </div>
			   </form>
			</div>
	   </div>
	</div>
	</div>
	</div>
	 <div class="footer">
		<div class="wrap">
			<div class="contact-section">
				<div class="col-md-4 follow text-left">
				</div>
				<div class="col-md-4 subscribe text-left">
				</div>
				<div class="col-md-4 help text-right">
					<h3>Need Help?</h3>
					<p></p>
					<a href="contact.jsp">Contact us</a>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="footer-middle">
				<div class="col-md-6 different-products"></div>
				<div class="col-md-6 about-text text-right">
					<h4>About BoxShop</h4>
					<p>The fashion never alters, and as it is neither disagreeable nor uneasy, so it is suited to the climate, and calculated both for their summers and winters. Every family makes their own clothes; but all among them, women as well as men, learn one or other of the trades formerly mentioned.</p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="cards text-center">
				<img src="images/cards.jpg" alt="" />
			</div>
			<div class="copyright text-center">
				<p>Copyright &copy; 2015 All rights reserved | Template by  <a href="http://w3layouts.com">  W3layouts</a></p>
			</div>

		</div>
	 </div>
</body>
</html>