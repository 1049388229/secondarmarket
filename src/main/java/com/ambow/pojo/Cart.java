package com.ambow.pojo;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {

    Map<Integer,CartItem> cartItemMap=new HashMap<>();

    public Map<Integer, CartItem> getCartItemMap() {
        return cartItemMap;
    }

    public void setCartItemMap(Map<Integer, CartItem> cartItemMap) {
        this.cartItemMap = cartItemMap;
    }

    public void removeCartItem(int pid){
        cartItemMap.remove(pid);
    }

    public void addCartItemToCar(CartItem cartItem){
        int pid= cartItem.getProduct().getId();
        if (cartItemMap.containsKey(pid)){
            removeCartItem(pid);
            cartItemMap.put(pid,cartItem);
        }else{
            cartItemMap.put(pid,cartItem);
        }

    }

    public Collection getCartItems(){
        return cartItemMap.values();
    }
}
