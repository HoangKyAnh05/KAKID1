/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author ngoch
 */
public class Suppliers {

    private int supplierId;
    private String name;
    private String email;
    private String phone;
    private String supplyManager;
    private String address;
    private Date createdAt;

    public Suppliers() {
    }

    public Suppliers(int supplierId, String name, String email, String phone, String supplyManager, String address, Date createdAt) {
        this.supplierId = supplierId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.supplyManager = supplyManager;
        this.address = address;
        this.createdAt = createdAt;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
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

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSupplyManager() {
        return supplyManager;
    }

    public void setSupplyManager(String supplyManager) {
        this.supplyManager = supplyManager;
    }

}
