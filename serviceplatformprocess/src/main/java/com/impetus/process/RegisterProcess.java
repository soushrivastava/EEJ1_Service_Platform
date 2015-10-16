package com.impetus.process;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.impetus.process.dao.UserDao;
import com.impetus.process.dto.UserData;
import com.impetus.process.entities.SecUser;
import com.impetus.process.entities.UserRole;
import com.impetus.process.enums.Role;

/**
 * 
 * @author rakesh.singhania
 * 
 */
public class RegisterProcess {

	@Autowired
	private UserDao userDao;

	Logger logger = LoggerFactory.getLogger(getClass());

	public String registerUser(UserData userData) throws SQLException {

		String result = "SUCCESS";
		logger.info("Regestring user........");
		SecUser secUser = new SecUser();
		secUser.setEmail(userData.getEmail());
		secUser.setFirstName(userData.getFirstName());
		secUser.setLastName(userData.getLastName());
		secUser.setPassword(userData.getPassword());
		secUser.setUsername(userData.getEmail());
		List<UserRole> roles = new ArrayList<UserRole>();
		roles.add(userDao.getRoleById(Role.USER.getId()));
		secUser.setRoles(roles);
		if (!userDao.userExists(userData.getEmail())) {
			userDao.save(secUser);
		} else {
			logger.info("Regestring user........EMAIL ALREADY IN USE");
			result = "EMAIL ALREADY IN USE";
		}
		return result;
	}
}
