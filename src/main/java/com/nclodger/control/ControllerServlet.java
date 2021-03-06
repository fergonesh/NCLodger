package com.nclodger.control;

import com.nclodger.control.action.Action;
import com.nclodger.control.action.ActionFactory;
import com.nclodger.myexception.MyException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: Iaroslav
 * Date: 20.10.13
 * Time: 11:36
 */

public class ControllerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        String view = null;
        Action action = ActionFactory.getAction(request);
        try {
            view = action.execute(request, response);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());

            // If there is no other place for exception to be caught,
            // it will be caught here
            String message = "An internal error happend. Please, try again later.";
            request.setAttribute("error_message",message);
            view = "exception";

        }
        dispatch(request,response,view);
       //request.
    }

    private void dispatch(HttpServletRequest request, HttpServletResponse response, String view) throws ServletException, IOException {
        String prefix ="/WEB-INF/view/";
        if(view.equals("home")){
            prefix = "";
        }
        String sufix =".jsp";
        request.getRequestDispatcher(prefix + view + sufix).forward(request, response);
    }
}
