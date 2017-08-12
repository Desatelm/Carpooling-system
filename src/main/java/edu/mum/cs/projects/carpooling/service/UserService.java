package edu.mum.cs.projects.carpooling.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.cs.projects.carpooling.domain.entity.CustomUserDetails;
import edu.mum.cs.projects.carpooling.domain.entity.Role;
import edu.mum.cs.projects.carpooling.domain.entity.User;
import edu.mum.cs.projects.carpooling.repository.UsersRepository;

@Service
@Transactional
public class UserService {
	@Autowired
	private UsersRepository usersRepository;
	
	@Autowired
	private UserService userService;

	public void createUser(User user) {
		usersRepository.save(user);
	}

	public User getUserByID(int userId) {
		return usersRepository.findById(userId);
	}

	public User getUserByUserName(String username) throws UsernameNotFoundException {
		Optional<User> optionalUsers = usersRepository.findByName(username);
		if (!optionalUsers.isPresent()) {
			return null;
		}
		return optionalUsers.map(User::new).get();
	}

	public User getUser(String username) throws UsernameNotFoundException {
		Optional<User> optionalUsers = usersRepository.findByName(username);

		optionalUsers.orElseThrow(() -> new UsernameNotFoundException("Username not found"));
		return optionalUsers.map(CustomUserDetails::new).get();
	}

	@Transactional
	public void creatUsers() {
		
	}
		
}