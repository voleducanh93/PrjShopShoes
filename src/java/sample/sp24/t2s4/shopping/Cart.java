/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.sp24.t2s4.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author hoanv
 */
public class Cart {

    private Map<String, Shoes> cart;

    public Cart() {
    }

    public Cart(Map<String, Shoes> cart) {
        this.cart = cart;
    }

    public Map<String, Shoes> getCart() {
        return cart;
    }

    public void setCart(Map<String, Shoes> cart) {
        this.cart = cart;
    }

    public boolean add(Shoes shoes) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(shoes.getId())) {
                int currentQuantity = this.cart.get(shoes.getId()).getQuantity();
                shoes.setQuantity(currentQuantity + shoes.getQuantity());
            }
            cart.put(shoes.getId(), shoes);
            check = true;
        } catch (Exception e) {
        }
        return check;
    }

    public boolean edit(String id, int quantity) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    Shoes shoes = this.cart.get(id);
                    shoes.setQuantity(quantity);
                    this.cart.replace(id, shoes);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }
    public void remove(String id) {
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                }
            }
        } catch (Exception e) {
           
        }     
    }
}
