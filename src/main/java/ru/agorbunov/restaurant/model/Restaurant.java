package ru.agorbunov.restaurant.model;

import java.util.List;

/**
 * Class represents restaurant
 */
public class Restaurant extends BaseEntity {

    /*name of restaurant*/
    private String name;

    /*address of restaurant*/
    private String address;

    /*menuLists of restaurant*/
    private List<MenuList> menuLists;

    /*orders ordered in the restaurant  */
    private  List<Order> orders;

    public Restaurant() {
    }

    public Restaurant(String name, String address) {
        this.name = name;
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<MenuList> getMenuLists() {
        return menuLists;
    }

    public void setMenuLists(List<MenuList> menuLists) {
        this.menuLists = menuLists;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public void addMenuList(MenuList menuList){
        this.menuLists.add(menuList);
    }

    public void addOrder(Order order){
        this.orders.add(order);
    }

    @Override
    public String toString() {
        return "Restaurant{" +
                "name='" + name + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
