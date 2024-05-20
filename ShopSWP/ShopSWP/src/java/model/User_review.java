/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author MSI
 */
public class User_review {
    int review_id;
    int user_id;
    double rating_value;
    String comment;
    int ordered_product_id;

    public User_review() {
    }

    public User_review(int review_id, int user_id, double rating_value, String comment, int ordered_product_id) {
        this.review_id = review_id;
        this.user_id = user_id;
        this.rating_value = rating_value;
        this.comment = comment;
        this.ordered_product_id = ordered_product_id;
    }

    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public double getRating_value() {
        return rating_value;
    }

    public void setRating_value(double rating_value) {
        this.rating_value = rating_value;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getOrdered_product_id() {
        return ordered_product_id;
    }

    public void setOrdered_product_id(int ordered_product_id) {
        this.ordered_product_id = ordered_product_id;
    }
    
    
}
