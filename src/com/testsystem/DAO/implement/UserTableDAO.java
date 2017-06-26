package com.testsystem.DAO.implement;

import java.util.*;

import org.hibernate.*;

import com.testsystem.DAO.BaseDAO;
import com.testsystem.DAO.IUserTableDAO;
import com.testsystem.table.UserTable;

public class UserTableDAO extends BaseDAO implements IUserTableDAO{

	@Override
	public UserTable validateUser(String username, String password,
			String tableName) {
		String hql = "from ? u where u.username=? and u.password=?";
		Session session = getSession();
		Query query = session.createQuery(hql);
		query.setParameter(0, tableName);
		query.setParameter(1, username);
		query.setParameter(2, password);
		
		List users = query.list();
		java.util.Iterator it = users.iterator();
		while(it.hasNext()) {
			if(users.size()!=0) {
				UserTable user = (UserTable)it.next();
				return user;
			}
		}
		session.close();
		return null;
	}

	
}
