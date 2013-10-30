package com.nclodger.dao;


import com.nclodger.myexception.MyException;

import javax.naming.NamingException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * User: antoshka
 * Date: 08.10.13
 * Time: 21:19
 * To change this template use File | Settings | File Templates.
 */
public interface UserDaoInterface {
    public boolean insert(Users user) throws MyException;
    public boolean update (Users user);
    public boolean delete(Users user) throws ClassNotFoundException, SQLException;
    public boolean getUser(String email, String password) throws SQLException, NamingException, ClassNotFoundException, MyException;
    public Users find(int id) throws ClassNotFoundException, SQLException, MyException;
    public boolean confirm_register(Users user) throws Exception;
}
