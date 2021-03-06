package ru.agorbunov.restaurant.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.agorbunov.restaurant.model.Dish;
import ru.agorbunov.restaurant.model.Order;
import ru.agorbunov.restaurant.repository.*;
import ru.agorbunov.restaurant.service.OrderService;
import ru.agorbunov.restaurant.util.ValidationUtil;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import static ru.agorbunov.restaurant.util.ValidationUtil.*;

/**
 * Class for exchange order-entity data between web and orderRepository layers
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RestaurantRepository restaurantRepository;

    @Autowired
    private MenuListRepository menuListRepository;

    @Autowired
    private DishRepository dishRepository;

    /*save order if it is new entity and update if it is exist,
    *,int[] dishIds - Ids of dishes, int[] dishQuantityValues - dishes quantities,
    * each dishId from first arr matches its quantity from second arr, arrays must have equal size
    *userId and restaurantId in parameters is Ids of user and restaurant to which the order is belong
    * check that order not null, check that arrays have equals size
    * and check that order was found (order belongs to these user and restaurant
    * update totalOrdersAmount in corresponding user-entity in success case*/
    @Override
    public Order save(Order order, int userId, int restaurantId, int[] dishIds, int[] dishQuantityValues) {
        Assert.notNull(order,"order must not be null");
        checkAcceptableUpdate(order);
        checkArrCompatibility(dishIds,dishQuantityValues);
        ValidationUtil.checkEmpty(order.getDateTime(),"dateTime");
        ValidationUtil.checkEmptyArray(dishIds);
        ValidationUtil.checkEmptyArray(dishQuantityValues);
        int[] oldDishIds = new int[0];
        if (!order.isNew()){
            oldDishIds = getDishIds(orderRepository.getWithDishes(order.getId(),userId,restaurantId).getDishes().keySet());
        }
        Order result = checkNotFoundWithId(orderRepository.save(order,userId,restaurantId,dishIds,dishQuantityValues),order.getId());
        userRepository.saveValuesToDB(userId);
        restaurantRepository.saveValuesToDB(restaurantId);
        dishRepository.saveValuesToDB(getResultArr(oldDishIds,dishIds));
        menuListRepository.saveValuesToDB(menuListRepository.getByDish(dishIds[0]).getId());
        return result;
    }

    /*save order if it is new entity and update if it is exist,
    * userId and restaurantId in parameters is Ids of user and restaurant to which the order is belong,
    * if order is already exist and have collections of dishes they remain and not touch
    * check that order not null and check that order was found (order belongs to these user and restaurant*/
    @Override
    public Order save(Order order, int userId, int restaurantId) {
        Assert.notNull(order,"order must not be null");
        ValidationUtil.checkEmpty(order.getDateTime(),"dateTime");
        return checkNotFoundWithId(orderRepository.save(order,userId,restaurantId),order.getId());
    }

    /*delete order by Id, check that order was found */
    @Override
    public void delete(int id) {
        checkNotFoundWithId(orderRepository.delete(id),id);

    }

    /*get all orders*/
    @Override
    public List<Order> getAll() {
        return orderRepository.getAll();
    }

    /*get order by Id, userId and restaurantId in parameters is Ids of
    *user and restaurant to which the order is belong,
    *check that order was found (order belongs to these user and restaurant*/
    @Override
    public Order get(int id, int userId, int restaurantId) {
        return checkNotFoundWithId(orderRepository.get(id,userId,restaurantId),id);
    }

    /*get order by Id with collections of dishes which the order is have ,
    *userId and restaurantId in parameters is Ids of
    *user and restaurant to which the order is belong,
    *check that order was found (order belongs to these user and restaurant*/
    @Override
    public Order getWithDishes(int id, int userId, int restaurantId) {
        return checkNotFoundWithId(orderRepository.getWithDishes(id,userId,restaurantId),id);
    }

    /*get all orders that belongs to user with Id pass as parameter */
    @Override
    public List<Order> getByUser(int userId) {
        return orderRepository.getByUser(userId);
    }

    /*get all orders that belongs to user with Id pass as 1st parameter
    * and with status pass as 2nd parameter */
    @Override
    public List<Order> getByUserAndStatus(int userId, String status) {
        return orderRepository.getByUserAndStatus(userId,status);
    }

    /*get all orders that belongs to user with Id pass as 1st parameter
    * and which made on Date  pass as 2nd parameter */
    @Override
    public List<Order> getByUserAndDate(int userId, LocalDateTime localDateTime) {
        return orderRepository.getByUserAndDate(userId,localDateTime);
    }

    /*get all orders that belongs to user with Id pass as 1st parameter
    * and with status pass as 2nd parameter and which made on Date  pass as 3rd parameter */
    @Override
    public List<Order> getByUserAndStatusAndDate(int userId, String status, LocalDateTime localDateTime) {
        return orderRepository.getByUserAndStatusAndDate(userId,status,localDateTime);
    }

    /*get all orders that belongs to dish with Id pass as parameter */
    @Override
    public List<Order> getByDish(int dishId) {
        return orderRepository.getByDish(dishId);
    }

    /*get all orders that belongs to dish with Id pass as parameter
     * and with status pass as 2nd parameter*/
    @Override
    public List<Order> getByDishAndStatus(int dishId, String status) {
        return orderRepository.getByDishAndStatus(dishId,status);
    }

    /*get all orders that belongs to dish with Id pass as parameter
    * and which made on Date  pass as 2nd parameter */
    @Override
    public List<Order> getByDishAndDate(int dishId, LocalDateTime localDateTime) {
        return orderRepository.getByDishAndDate(dishId, localDateTime);
    }

    /*get all orders that belongs to dish with Id pass as parameter
    * and with status pass as 2nd parameter and which made on Date pass as 3rd parameter */
    @Override
    public List<Order> getByDishAndStatusAndDate(int dishId, String status, LocalDateTime localDateTime) {
        return orderRepository.getByDishAndStatusAndDate(dishId,status,localDateTime);
    }

    /*delete order by Id, userId and restaurantId in parameters is Ids of
    *user and restaurant to which the order is belong, check that updates acceptable
    *  update totalOrdersAmount in corresponding user-entity in success case*/
    @Override
    public void delete(int id, int userId, int restaurantId) {
        Order order = getWithDishes(id,userId,restaurantId);
        checkAcceptableUpdate(order);
        delete(id);
        userRepository.saveValuesToDB(userId);
        restaurantRepository.saveValuesToDB(restaurantId);
        int[] dishIds = getDishIds(order.getDishes().keySet());
        dishRepository.saveValuesToDB(dishIds);
        menuListRepository.saveValuesToDB(menuListRepository.getByDish(dishIds[0]).getId());
    }

    /*transform Set<Dish> to int[] of dishes ids*/
    private int[] getDishIds(Set<Dish> dishes){
        int[] result = new int[dishes.size()];
        int counter = 0;
        for (Dish dish : dishes){
            result[counter++] = dish.getId();
        }
        return result;
    }

    /*get result int[] containing all elements of two arrays int[] sending in parameters*/
    private int[] getResultArr(int[] oldDishesIds, int[] newDishesIds){
        List<Integer> list = new ArrayList<>();
        for (Integer dishId : oldDishesIds){
            list.add(dishId);
        }

        for (Integer dishId : newDishesIds){
            if (!list.contains(dishId)){
                list.add(dishId);
            }
        }
        int[] result = new int[list.size()];
        for (int index = 0; index < list.size(); index++){
            result[index] = list.get(index);
        }
        return result;
    }
}
