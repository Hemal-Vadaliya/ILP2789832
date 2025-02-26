package com.mvc.model;

public class Bill {
    private int id;
    private String consumerNumber;
    private String billDate;
    private String billingPeriod;
    private double billAmount;
    private String dueDate;
    
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getConsumerNumber() { return consumerNumber; }
    public void setConsumerNumber(String consumerNumber) { this.consumerNumber = consumerNumber; }

    public String getBillDate() { return billDate; }
    public void setBillDate(String billDate) { this.billDate = billDate; }

    public String getBillingPeriod() { return billingPeriod; }
    public void setBillingPeriod(String billingPeriod) { this.billingPeriod = billingPeriod; }

    public double getBillAmount() { return billAmount; }
    public void setBillAmount(double billAmount) { this.billAmount = billAmount; }

    public String getDueDate() { return dueDate; }
    public void setDueDate(String dueDate) { this.dueDate = dueDate; }
}
