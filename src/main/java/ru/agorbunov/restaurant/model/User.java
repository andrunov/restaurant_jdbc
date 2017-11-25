package ru.agorbunov.restaurant.model;

import java.util.EnumSet;
import java.util.List;
import java.util.Set;

/**
 * Class represents users
 */
public class User extends BaseEntity {

    /*user's name*/
    private String name;

    /*users e-mail*/
    private String email;

    /*users password*/
    private String password;

    /*enabled-disabled*/
    private boolean enabled;

    /*marks that this user has orders*/
    private boolean hasOrders;

    /*total amount of users orders*/
    private double totalOrdersAmount;

    /*users roles*/
    private Set<Role> roles;

    /*orders has made by the user */
    private List<Order> orders;


    public User() {
    }

    public User(String name, String email, String password, Role role, Role... roles) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.enabled = true;
        this.roles = EnumSet.of(role, roles);
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public double getTotalOrdersAmount() {
        return totalOrdersAmount;
    }

    public void setTotalOrdersAmount(double totalOrdersAmount) {
        this.totalOrdersAmount = totalOrdersAmount;
    }

    public boolean isHasOrders() {
        return hasOrders;
    }

    public void setHasOrders(boolean hasOrders) {
        this.hasOrders = hasOrders;
    }

    @Override
    public String toString() {
        return "User{" +
                "email='" + email + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
