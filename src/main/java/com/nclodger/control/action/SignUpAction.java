package com.nclodger.control.action;

import com.nclodger.dao.UserDao;
import com.nclodger.dao.Users;
import com.nclodger.myexception.MyException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: Iaroslav
 * Date: 21.10.13
 * Time: 21:29
 */
public class SignUpAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws MyException {
        UserDao users = new UserDao();
        Users u = new Users();
        boolean bool;
/*        try {
            bool = users.insert(1,request.getParameter("email"),request.getParameter("password1"),
                    request.getParameter("username"),0);
        } catch (MyException ex) {
            return "exception";
        }*/
        try {
            bool = users.insert(u);
        } catch (MyException ex) {
            request.setAttribute("error_message",ex.getMessage());
            return "exception";
        }
        if(bool)
        return "signup_succeed";
        else
            return "home";
    }
}
