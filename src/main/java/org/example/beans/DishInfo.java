package org.example.beans;

import org.example.model.Dish;

public class DishInfo {
    private Dish dish;
    private int amount;

    public void setDish(Dish dish){
        this.dish = dish;
    }

    public Dish getDish(){
        return this.dish;
    }

    public void setAmount(int amount){
        this.amount = amount;
    }

    public int getAmount(){
        return this.amount;
    }
}
