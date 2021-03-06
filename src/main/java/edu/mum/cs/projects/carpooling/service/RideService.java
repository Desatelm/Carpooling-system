package edu.mum.cs.projects.carpooling.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.mum.cs.projects.carpooling.domain.entity.Ride;
import edu.mum.cs.projects.carpooling.domain.entity.RideStatus;
import edu.mum.cs.projects.carpooling.repository.RideRepository;

@Service
@Transactional
public class RideService {

	@Autowired
	private RideRepository rideRepository;

	public void createRide(Ride ride) {
		rideRepository.save(ride);
	}

	public List<Ride> findByRide(String departure, String destination) {

		return rideRepository.findByDepartureLikeAndDestinationLike(departure, destination);

	}

	public List<Ride> findByRideF(String departure, String destination, Date date, int seat) {
		return rideRepository.findByDepartureLikeAndDestinationLikeAndDepartureDateEqualsAndNoSeatGreaterThanEqual(
				departure, destination, date, seat);
	}

	public Ride getRideByDeparture(String departure) {
		return rideRepository.findByDeparture(departure);
	}

	public Ride getRideByDestination(String destination) {
		return rideRepository.findByDestination(destination);
	}

	public Ride getRideByDepartureDate(String departureDate) {
		return rideRepository.findByDeparture(departureDate);
	}

	public Ride getRideByStatus(RideStatus status) {
		return rideRepository.findByStatus(status);
	}

	public List<Ride> getAllRides() {
		return rideRepository.findAllByOrderByIdDesc();
		
	}

	public Ride getRideById(int id) {
		return rideRepository.findById(id);
	}

	public List<Ride> getRideByEmail(String email) {
		return rideRepository.findDistinctByUser_emailAddress(email);
	}

	public List<Ride> getBookedRides(String email) {
		return rideRepository.getBookedRides(email);
	}
	
	public Ride findById(int id)
	{
		return rideRepository.findById(id);
	}
	
	public void cancelRide(int userId, int rideId)
	{
		rideRepository.cancelRide(userId, rideId);
	}
	
	public void removeRide( int rideId)
	{
		rideRepository.delete(rideId);;
	}
}
