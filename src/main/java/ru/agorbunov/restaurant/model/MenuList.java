package ru.agorbunov.restaurant.model;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Class represents menu list
 */
public class MenuList extends BaseEntity {

    /*name of menuList*/
    private String description;

    /*restaurant to which the menuList is belong*/
    private Restaurant restaurant;

    /*List of dishes that were include in menuList*/
    private List<Dish> dishList;

    /*Date and Time when menuList was made*/
    private LocalDateTime dateTime;

    /*enabled-disabled*/
    private boolean enabled;

    public MenuList() {
    }

    public MenuList(Restaurant restaurant, String description, LocalDateTime dateTime) {
        this.restaurant = restaurant;
        this.description = description;
        this.dateTime = dateTime;
        this.enabled = true;
    }

    public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    public List<Dish> getDishList() {
        return dishList;
    }

    public void setDishList(List<Dish> dishList) {
        this.dishList = dishList;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Override
    public String toString() {
        return "MenuList{" +
                "description='" + description + '\'' +
                ", dateTime=" + dateTime +
                '}';
    }
}
