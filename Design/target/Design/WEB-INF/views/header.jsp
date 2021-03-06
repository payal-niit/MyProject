<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> <meta name="keywords" content="">
    <style type="text/css">
    
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 100%;
      margin: auto; height:500px;
  }
  #div2 {
    width: 100px;
    height: 100px;
    background: red;
    -webkit-transition: width 2s, height 4s; /* For Safari 3.1 to 6.0 */
    transition: width 2s, height 4s;
}

#div2:hover {
    width: 300px;
    height: 300px;
}
  

    </style>

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link href="resources/css/font-awesome.css" rel="stylesheet">
    <link href="resources/css/flip-animation.css" rel="stylesheet">
    <link href="resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/animate.min.css" rel="stylesheet">
    <link href="resources/css/owl.carousel.css" rel="stylesheet">
    <link href="resources/css/owl.theme.css" rel="stylesheet">
	<link href="resources/css/owl.transitions.css" rel="stylesheet">
    <!-- theme stylesheet -->
    <link href="resources/css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="resources/css/custom.css" rel="stylesheet">

    <script src="resources/js/respond.min.js"></script>

    <link rel="shortcut icon" href="favicon.png">

<title>Insert title here</title>
</head>
<body ng-app="myNewApp" ng-controller="myNewController">

    <!-- *** TOPBAR ***
 _________________________________________________________ -->
    <div id="top">
        <div class="container">
            <div class="col-md-6 offer" data-animate="fadeInDown">
                <a href="#" class="btn btn-success btn-sm" data-animate-hover="shake">Offer of the day</a>  <a href="#">Get flat 35% off on orders over $50!</a>
            </div>
            <div class="col-md-6" data-animate="fadeInDown">
                <ul class="menu">
                       			 <c:if test="${pageContext.request.userPrincipal.name==null}">
                    <li><a href="login">Login</a>
                    </li>
                    <li><a href="registration">Register</a>
                    </li></c:if>
                    <li><a href="#">Contact</a>
                    </li>
                    <li><a href="#">Recently viewed</a>
                    </li>
                </ul>
            </div>
        </div>
       
    </div>

    <!-- *** TOP BAR END *** -->

    <!-- *** NAVBAR ***
 _________________________________________________________ -->

    <div class="navbar navbar-default yamm" role="navigation" id="navbar">
        <div class="container">
             <div class="navbar-header">

               <!--  <a class="navbar-brand home" href="index.html" data-animate-hover="bounce">
                    <img src="resources/image/BoldMedia-flat-logo.png" alt="logo" class="hidden-xs" hidden="true">
                    <img src="resources/image/BoldMedia-flat-logo.png" alt="logo" class="visible-xs" hidden="true"><span class="sr-only">go to homepage</span>
                </a> -->
                <div class="navbar-buttons">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-align-justify"></i>
                    </button>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>
                    <a class="btn btn-default navbar-toggle" href="#">
                        <i class="fa fa-shopping-cart"></i>  <span class="hidden-xs">cart</span>
                    </a>
                </div>
            </div>
             <!--/.navbar-header -->

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li class="active"><a href="home">Home</a>
                    </li>
                    <!-- Start c:ForEach here -->
			<c:forEach items="${categoriesList}" var="category">
                    
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">${category.categoryName} <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        					<c:forEach items="${category.subCategory}" var="subCategory">
                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                        <div class="col-sm-3">
                                         <h5><a href="allproducts?search=${subCategory.subCategoryName}">${subCategory.subCategoryName}</a></h5>
                                            <ul>
                                                
							<c:forEach items="${subCategory.product}" var="product">
							<li>
						
							<a href="viewproduct-${product.productId}-product">${product.productName}</a></li>
							
							</c:forEach><!-- End of third c:forEach -->
                            
                                            </ul>
                                        </div>
                                                       </div>
                                    </div>
                                    </li>
                                    </c:forEach><!-- End of second c:foreach  -->
                                    </ul>
                                    </li></c:forEach><!-- End of First c:foreach  -->
                                    <c:if test="${pageContext.request.userPrincipal.name!=null}">
       			  <li><a href="#">Welcome
       			  <sec:authorize access="isAuthenticated()">  
        		  <strong><sec:authentication property="principal.username"/></strong>
        		  </sec:authorize></a>
       			  </li>
       			  </c:if>
       			  
       			   <c:if test="${pageContext.request.userPrincipal.name!=null}">
        		<sec:authorize access="isAuthenticated()"> 
        		<li><a href="perform_logout">Logout</a></li>
        		</sec:authorize></c:if>
                                    </ul>
                                </div>
                                <!-- /.yamm-content -->
                            
            <!--/.nav-collapse -->

            <div class="navbar-buttons">

                <div class="navbar-collapse collapse right" id="basket-overview">
                    <a href="#" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm"> cart</span></a>
                </div>
                <!--/.nav-collapse -->

                <div class="navbar-collapse collapse right" id="search-not-mobile">
                    <button type="button" class="btn navbar-btn btn-primary" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>
                </div>

            </div>

            <div class="collapse clearfix" id="search" >

                <form class="navbar-form" role="search" >
                    <div class="input-group">
                        <input type="text" id="search" class="form-control" placeholder="Search" ng-model="searchkeyword" ng-keyup="complete()">
                      <span class="input-group-btn btn btn-primary"><a href="allproducts?search={{searchkeyword}}">  
								<i class="glyphicon glyphicon-search white "></i></a>

		    </span>
                    </div>
                </form>

            </div>
            <!--/.nav-collapse -->

        </div>
        <!-- /.container -->
    </div>
    <!-- /#navbar -->

    <!-- *** NAVBAR END *** -->
    
    <!-- ----------------------second navbar------------------------------------------------ -->
   
      
        <c:if test="${pageContext.request.userPrincipal.name!=null}">		  
       		<sec:authorize access="hasRole('ROLE_ADMIN')">  
     <div class="navbar navbar-default yamm" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNewNavbar">
 <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <div class="collapse navbar-collapse" id="myNewNavbar">
     
      <ul class="nav navbar-nav">
       
        <li ><a href="categories">Categories</a></li>
        <li><a href="subCategories">SubCategories</a></li>
        
        <li><a href="products">Products</a></li>
      
        <li><a href="registration">Registration</a></li>
      </ul>
      
      </div>
    </div></div></div></sec:authorize></c:if>
    
         
    <script src="resources/js/jquery-1.11.0.min.js"></script>
    <script src="resources/js/jquery.autocomplete.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery.cookie.js"></script>
    <script src="resources/js/waypoints.min.js"></script>
    <script src="resources/js/modernizr.js"></script>
    <script src="resources/js/bootstrap-hover-dropdown.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/front.js"></script>
  <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>-->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    
