package com.impetus.process.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * UserRole generated by hbm2java
 */
@Entity
@Table(name = "USER_ROLE")
@GenericGenerator(name = "UserRole", strategy = "org.hibernate.id.enhanced.TableGenerator", parameters = {
		@Parameter(name = "segment_value", value = "USER_ROLE"),
		@Parameter(name = "increment_size", value = "10"),
		@Parameter(name = "optimizer", value = "pooled") })
public class UserRole implements java.io.Serializable {

	@Id
	@GeneratedValue(generator = "UserRole")
	@Column(name = "ROLE_ID")
	private Integer roleId;
	@Column(name = "ROLE_NAME")
	private String roleName;
	@Column(name = "INTERNAL_CODE")
	private String internalCode;

	public UserRole() {
	}

	public UserRole(String internalCode) {
		this.internalCode = internalCode;
	}

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Column(name = "INTERNAL_CODE", unique = true, nullable = false)
	public String getInternalCode() {
		return this.internalCode;
	}

	public void setInternalCode(String internalCode) {
		this.internalCode = internalCode;
	}

	/**
	 * @return the roleName
	 */
	public String getRoleName() {
		return roleName;
	}

	/**
	 * @param roleName
	 *            the roleName to set
	 */
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
