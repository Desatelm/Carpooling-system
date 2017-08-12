package edu.mum.cs.projects.carpooling.domain.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.*;;


@Entity
@Table(name = "user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "user_id")
	private int id;	
	@Column(name = "name", unique = true)
	private String name;
	
	@Column(name = "email", unique = true)
	private String emailAddress;
	
	@Column(name = "first_name")
	private String firstName;
	
	@Column(name = "last_name")
	private String lastName;
	
	@Column(name = "sex")
	private String sex;
	
	@Column(name = "active")
	private int active;
	
	@Column(name = "phone_no", unique = true)
	private String phone;
	
	@Column(name = "date_of_birth")
	@Temporal(TemporalType.DATE)
	private Date DOB;
	
	@Lob
	@Column(name = "picture")
	private Boolean[] profilePicture;
	
	@Embedded
	private Address address;
	
	@Column(name = "password")
	private String password;
	
	@OneToMany(mappedBy="user")
	private List<Vichele> vicheles = new ArrayList<Vichele>();
	
	@Embedded
	private Rating rating;
	
	@OneToOne(mappedBy="user")
	private MessageBox messageBox;
	
	@OneToMany(mappedBy="user")
	private List<Ride> ride = new ArrayList<>();
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Role roles;
	
	public User(){
		
	}
	
	public User (User user){
		this.active = user.getActive();
		this.address = user.getAddress();
		this.DOB = user.getDOB();
		this.firstName = user.getFirstName();
		this.lastName = user.getLastName();
		this.messageBox = user.getMessageBox();
		this.emailAddress = user.getEmailAddress();
		this.password = user.getPassword();
		this.phone = user.getPhone();
		this.rating =user.getRating();
		this.ride = user.getRide();
		this.sex = user.getSex();
		this.roles = user.getRoles();
		this.vicheles = user.getVicheles();		
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getSex() {
		return sex;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getDOB() {
		return DOB;
	}

	public void setDOB(Date dOB) {
		DOB = dOB;
	}

	public Boolean[] getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(Boolean[] profilePicture) {
		this.profilePicture = profilePicture;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Vichele> getVicheles() {
		return vicheles;
	}

	public void setVicheles(List<Vichele> vicheles) {
		this.vicheles = vicheles;
	}

	public Rating getRating() {
		return rating;
	}

	public void setRating(Rating rating) {
		this.rating = rating;
	}

	public MessageBox getMessageBox() {
		return messageBox;
	}

	public void setMessageBox(MessageBox messageBox) {
		this.messageBox = messageBox;
	}

	public List<Ride> getRide() {
		return ride;
	}

	public void setRide(List<Ride> ride) {
		this.ride = ride;
	}

	public Role getRoles() {
		return roles;
	}

	public void setRoles(Role roles) {
		this.roles = roles;
	}
	
	



}