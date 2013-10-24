package com.nclodger.control.action;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 * Created with IntelliJ IDEA.
 * User: Iaroslav
 * Date: 21.10.13
 * Time: 21:26
 */
public class ActionFactory {

    private static final Map<String,Action> actions;
    static{
        actions = new HashMap<String, Action>();
        actions.put("/signup", new SignUpAction());
        actions.put("/siginin", new SignInAction());
        //TODO: other actions
    }

    public static Action getAction(HttpServletRequest request) {
        return actions.get(request.getServletPath());
    }
}
