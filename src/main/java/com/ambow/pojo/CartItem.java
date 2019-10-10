package com.ambow.pojo;

public class CartItem {
    private Product  product;

    public CartItem(){

    }

    public CartItem(Product product) {
        this.product = product;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
