package ru.agorbunov.restaurant.to;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * class for works with User entity in some web forms
 */
public class UserTo implements Serializable{

    private static final long serialVersionUID = 1L;

    @NotNull
    private String name;

    @NotNull
    private String email;

    @Size(min = 5, max = 20, message = "error.password")
    private String password;

    public UserTo() {
    }

    public UserTo(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "UserTo{" +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
