package ru.agorbunov.restaurant.model;

import ru.agorbunov.restaurant.util.ComparatorUtil;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * Class represents order
 */
public class Order extends BaseEntity {

    /*user which has made the Order*/
    private User user;

    /*restaurant in which Order was made*/
    private Restaurant restaurant;

    /*list of OrdersDishes elements that represents
     *many-to-many relationship between Orders and Dishes
     * with one additional field - quantity of Dish in order*/
    private List<OrdersDishes> dishes;

    /*Date and Time when Order made*/
    private LocalDateTime dateTime;

    /*Status of order*/
    private Status status;

    /*Total price of order*/
    private double totalPrice;

    public Order() {
    }

    public Order(User user, Restaurant restaurant, LocalDateTime dateTime) {
        this.user = user;
        this.restaurant = restaurant;
        this.dateTime = dateTime;
        this.status = Status.ACCEPTED;
    }

    public Order(User user, Restaurant restaurant, List<OrdersDishes> dishes, LocalDateTime dateTime, Status status) {
        this.user = user;
        this.restaurant = restaurant;
        this.dishes = dishes;
        this.dateTime = dateTime;
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }


    /*getter and setter of List<OrdersDishes> dishes returns and accepts
    * Map<Dish,Integer> for comfortable use in other layers*/

    /*method returns from List<OrdersDishes> orders map with keys - dishes and values -
    * quantities of this dish in the order  */
    public Map<Dish, Integer> getDishes() {
        Map<Dish,Integer> result = new TreeMap<>(ComparatorUtil.dishComparator);
        for (OrdersDishes dish : dishes){
            result.put(dish.getDish(), dish.getDishQuantity());
        }
        return result;
    }

    /*method save map wit keys - dishes and values
    *- quantities of this dish in the order into  List<OrdersDishes> dishes*/
    public void setDishes(Map<Dish, Integer> dishes) {
        List<OrdersDishes> result = new ArrayList<>();
        for (Map.Entry<Dish,Integer> dish : dishes.entrySet()){
            OrdersDishes orderDishes = new OrdersDishes();
            orderDishes.setOrder(this);
            orderDishes.setDish(dish.getKey());
            orderDishes.setDishQuantity(dish.getValue());
            result.add(orderDishes);
        }
        this.dishes = result;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "Order{" +
                "dateTime=" + dateTime +
                '}';
    }
}
