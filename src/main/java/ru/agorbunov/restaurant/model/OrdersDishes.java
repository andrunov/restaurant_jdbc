package ru.agorbunov.restaurant.model;

/**
 * Entity represents many-to0many relationship between Order and Dish
 * with one additional field - quantity of dishes
 */
public class OrdersDishes {

    /*represents Order*/
    private Order order;

    /*represents Dish*/
    private Dish dish;

    /*represents quantity of dishes*/
    private int dishQuantity;

    public int getDishQuantity() {
        return dishQuantity;
    }

    public void setDishQuantity(int dishQuantity) {
        this.dishQuantity = dishQuantity;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Dish getDish() {
        return dish;
    }

    public void setDish(Dish dish) {
        this.dish = dish;
    }
}
