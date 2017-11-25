package ru.agorbunov.restaurant.model;

import ru.agorbunov.restaurant.util.ComparatorUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * Class represents dish
 */
public class Dish extends BaseEntity {

    /*Name of dish*/
    private String description;

    /*price of dish*/
    private Double price;

    /*menuList to which this dish is belonging*/
    private MenuList menuList;

    /*marks that this dish has orders*/
    private boolean hasOrders;

    /*list of OrdersDishes elements that represents
     *many-to-many relationship between Orders and Dishes
     * with one additional field - quantity of Dish in order*/
    private List<OrdersDishes> orders;

    public Dish() {
    }

    public Dish(String description, Double price) {
        this.description = description;
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public MenuList getMenuList() {
        return menuList;
    }

    public void setMenuList(MenuList menuList) {
        this.menuList = menuList;
    }

    public boolean isHasOrders() {
        return hasOrders;
    }

    public void setHasOrders(boolean hasOrders) {
        this.hasOrders = hasOrders;
    }

    /*getter and setter of List<OrdersDishes> orders returns and accepts
    * Map<Order,Integer> for comfortable use in other layers*/

    /*method returns from List<OrdersDishes> orders map with keys - orders and values -
    * quantities of orders of the dish  */
    public Map<Order,Integer> getOrders() {
        Map<Order,Integer> result = new TreeMap<>(ComparatorUtil.orderComparator);
        for (OrdersDishes order : orders){
            result.put(order.getOrder(),order.getDishQuantity());
        }
        return result;
    }

    /*method save map wit keys - orders and values
    *- quantities of orders of the dish into  List<OrdersDishes> orders*/
    public void setOrders(Map<Order,Integer> ordersMap) {
        List<OrdersDishes> result = new ArrayList<>();
        for (Map.Entry<Order,Integer> order : ordersMap.entrySet()){
            OrdersDishes element = new OrdersDishes();
            element.setDish(this);
            element.setOrder(order.getKey());
            element.setDishQuantity(order.getValue());
            result.add(element);
        }
        this.orders = result;
    }

    @Override
    public String toString() {
        return "Dish{" +
                "price=" + price +
                ", description='" + description + '\'' +
                '}';
    }
}
