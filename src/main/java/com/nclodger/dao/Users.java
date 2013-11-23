package com.nclodger.dao;

import java.io.Serializable;

public class Users implements Serializable{
    // PROPERTIES
    private int id;
    private String email;
    private String pswd;
    private String name;
    private int confirm_register;
    private int id_ut;


    // CONSTRUCTORS
    public Users() {
    }

    public Users(int id,String username) {
        this.id = id;
        this.name = username;
    }

    public Users(int id, String email, String pswd, String name, int confirm_register) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.pswd = pswd;
        this.confirm_register = confirm_register;
    }

    // GETTERS / SETTERS
    public void setId_ut(int id_ut) {
        this.id_ut = id_ut;
    }

    public int getId_ut() {
        return id_ut;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return this.id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return this.email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public String getPswd() {
        return this.pswd;
    }

    public void setPswd(String pswd) {
        this.pswd = pswd;
    }

    public int get_confirm_register() {
        return this.confirm_register;
    }

    public void set_confirm_register(int _confirm_register) {
        this.confirm_register = _confirm_register;
    }

}
