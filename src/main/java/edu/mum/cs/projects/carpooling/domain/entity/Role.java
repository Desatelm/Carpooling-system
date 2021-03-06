package edu.mum.cs.projects.carpooling.domain.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class Role {

	@Id
	@Column(name = "role_id")
	private int roleId;

	@Column(name = "role")
	private String roleType;

	public Role() {
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getRole() {
		return roleType;
	}

	public void setRole(String role) {
		this.roleType = role;
	}

}
