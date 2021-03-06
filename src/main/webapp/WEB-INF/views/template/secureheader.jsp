<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>Car Pooling Web Application</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value="/static/css/bootstrap.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="/static/css/main.css"/>" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value="/static/css/custom.css"/>" rel="stylesheet">
<link href="<c:url value="/static/css/jumbotron.css"/>" rel="stylesheet">
<link href="<c:url value="/static/css/panels.css"/>" rel="stylesheet">
<link href="<c:url value="/static/css/error.css"/>" rel="stylesheet">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="<c:url value="/static/js/user.js"/>"></script>

<%-- <script src="<c:url value="/static/js/locationMap.js"/>"></script> --%>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBI42L7mYrE1udMiU98gNXDX8Qv=3.exp&sensor=false&libraries=places"></script>


</head>

<body
	style="background-image: url(/static/welcome.jpg); height: 60vh; background-attachment: fixed; background-size: 100vw 100vh; background-repeat: no-repeat; margin-bottom: 40px;">


	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Car-pooling</a>
			</div>

			<ul class="nav navbar-nav">
				<sec:authorize access="hasRole('ROLE_RIDER')">
					<li>
						<form action="../getProfile" method="post" class="form-horizontal">
							<div class="form-group " class="col-xs-4"
								style="margin-top: 25px; margin-left: 25px">

								<input type="search" class="form-control input-sm" id="id"
									name="username" placeholder="search user "> <span
									style="margin-top: 25px; margin-left: 25px"
									class="glyphicon glyphicon-search form-control-feedback"></span>

							</div>

						</form> <a href="/ride/myRides">My Booked Rides</a>
					</li>
				</sec:authorize>
			</ul>
			<ul class="nav navbar-nav">

				<sec:authorize access="hasRole('ROLE_DRIVER')">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">DRIVER <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#"></a></li>
							<li><a href="../car_registrationForm">AddCar</a></li>
							<li role="separator" class="divider"></li>

							<li><a href="/ride/myRides">See My Ride Offers</a></li>
							

						</ul>
						<form action="../getProfile" method="post" class="form-horizontal">
							<div class="form-group " class="col-xs-4"
								style="margin-top: 25px; margin-left: 25px">
								<input type="search" class="form-control input-sm" id="id"
									name="username" placeholder="search user "> <span
									style="margin-top: 25px; margin-left: 25px"
									class="glyphicon glyphicon-search form-control-feedback"></span>

							</div>
						</form></li>

				</sec:authorize>
			</ul>
			<ul class="nav navbar-nav">
			<li>
								<form class="form-inline " style= "margin-top: 120px; margin-left: 40px;" action="/search" method="post">
									<label class="sr-only" for="departure"></label> <input
										type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
										name="departure" value="${departure }" id="departure"
										placeholder="Your Departure"> <label class="sr-only"
										for="inlineFormInputGroup"></label>
									<div class="input-group mb-2 mr-sm-2 mb-sm-0">
										<input type="text" class="form-control" id="destination"
											value="${destination }" name="destination"
											placeholder="Your Destination">
									</div>
                            
									<button type="submit" class="btn btn-primary">Search
										For a Ride</button>
								</form>
							</li>
							</ul>
             
			<ul class="nav navbar-nav">
				<sec:authorize access="isAuthenticated()">
					<li>
						<form action="../getMessages" method="get" class="form-horizontal">
							<div class="form-group " class="col-xs-4"
								style="margin-top: 25px; margin-left: 25px">
								<input class="form-control" name="email" type="hidden"
									value=${email} >
								<div class="col-md-8">
									<input type="submit" class="btn btn-primary" value=" MailBox">
								</div>
							</div>
						</form>
					</li>
				</sec:authorize>
			</ul>

			<sec:authentication var="principal" property="principal" />
			<div id="navbar" class="navbar-collapse collapse">
			    <a href="../welcome">home</a>
				<form action="/login" class="navbar-form navbar-right">
					<sec:authorize access="isAuthenticated()">
						<span class="glyphicon glyphicon-user" style = "color: white;"> ${username} </span>
					</sec:authorize>
                  
					<button type="submit" class="btn btn-success">Sign Out</button>
				</form>
			</div>
			<!--/.navbar-collapse -->
		</div>
	</nav>

	<br />
	<div class="container">
		<form class="form-inline" action="/search" method="post">
			<label class="sr-only" for="departure"></label> <input type="text"
				class="form-control mb-2 mr-sm-2 mb-sm-0" name="departure"
				value="${departure }" id="departure" placeholder="Your Departure">
			<label class="sr-only" for="inlineFormInputGroup"></label>
			<div class="input-group mb-2 mr-sm-2 mb-sm-0">
				<input type="text" class="form-control" id="destination"
					value="${destination }" name="destination"
					placeholder="Your Destination">
			</div>

			<button type="submit" class="btn btn-primary">Search For a
				Ride</button>
		</form>
	</div>




	<div style="height: 50px;"></div>

	<!-- Google Api -->
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmMANqWLDs12mTUiiX4SuLJeftpYyQdgk&libraries=places"></script>
	<script>
		function initialize() {
			var departure = document.getElementById("departure");
			var destination = document.getElementById("destination");
			var autocomplete = new google.maps.places.Autocomplete(departure);
			var autocomplete2 = new google.maps.places.Autocomplete(destination);
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>