/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * @author ngoch
 */
public class Item {
    private Product product;
    private int quantity;
    private int price;

    public Item() {
    }

    public Item(Product product, int quantity, int price) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }
 


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
public int getDiscountPrice() {
    return product.getDiscountPrice() * quantity; 
}
    @Override
    public String toString() {
        return "Item{" + "product=" + product + ", quantity=" + quantity + ", price=" + price + '}';
    }

}
