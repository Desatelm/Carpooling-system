<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="/WEB-INF/views/template/secureheader.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-sm-4">
			<form method="post" action="registed">
				<fieldset>
					<div class="form-row">
						<div>
							Departure : <input class="placepicker form-control" type="text"
								id="departure" name="departure" placeholder="Departure location" />

						</div>
						<div>
							Destination: <input type="text" class="placepicker form-control"
								id="destination" name="destination"
								placeholder="Destination location" />

						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								Departure Date : <input class="form-control"
									name="registration_date" id="registration-date"
									name="departureDate" type="date" />
							</div>
							<div class="form-group col-md-6">
								Departure Time : <input class="form-control"
									id="registration-time" name="departureTime" type="time" />
							</div>
						</div>
						<div>
							vehicle: <select name="model" class="form-control">
								<option value="2009">2009</option>
								<option value="2010">2010</option>
								<option value="2011">2011</option>
							</select>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								Number of Seats: <input type="number" class="form-control"
									name="noSeat" />
							</div>
							<div class="form-group col-md-6">
								Price: <input type="number" class="form-control" name="price" />
							</div>
						</div>

						<div>
							Waiting Time <input class="form-control" name="waitingTime" />
						</div>
						<div>
							<input class="form-control" name="email" type="hidden"
								value=${email} >
						</div>

						<button type="submit" class="btn btn-secondary btn-lg">POST</button>

					</div>
				</fieldset>
			</form>
		</div>
		<div class="col-sm-8">
			<div>
				<c:forEach var="post" items="${allRides}" >
					<div class="row">
						<ul>
							<li>
								<p>Departure : ${post.departure}</p>
								<p>Destination : ${post.destination}</p>
								<p>price : ${post.price}USD Available Seat: </p>
								<P>Status : ${post.status}</P>
								<p>Vehicle :</p>
							</li>
						</ul>
						<div>
							<a class="btn btn-primary btn-default" href="#" role="button">Apply</a>
						</div>
						<div>
							<textarea rows="3" cols="50" placeholder="write comment here ...."></textarea>
							<<a class="btn btn-primary btn-default" href="#" role="button">Post</a>
						</div>
						<hr>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script>
		function initialize() {
			var departure = document.getElementById("departure");
			var destination = document.getElementById("destination");
			var autocomplete = new google.maps.places.Autocomplete(departure);
			var autocomplete2 = new google.maps.places.Autocomplete(destination);

		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmMANqWLDs12mTUiiX4SuLJeftpYyQdgk&libraries=places"></script>
</div>
<%@include file="/WEB-INF/views/template/footer.jsp"%>
