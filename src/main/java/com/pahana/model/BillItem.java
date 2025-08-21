package com.pahana.model;

public class BillItem {
    private int billItemId;
    private int billId;
    private int itemId;
    private int quantity;
    private double unitPrice;
    private double subtotal;
    private Item item; // For display purposes
    
    public BillItem() {
    }

    public BillItem(int billItemId, int billId, int itemId, int quantity, 
                    double unitPrice, double subtotal) {
        this.billItemId = billItemId;
        this.billId = billId;
        this.itemId = itemId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.subtotal = subtotal;
    }

    // Getters and Setters
    public int getBillItemId() {
        return billItemId;
    }

    public void setBillItemId(int billItemId) {
        this.billItemId = billItemId;
    }

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }
}