/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import model.User;

/**
 *
 * @author MSI
 */
public class UserDAO extends DBContext {
    public User getAccountByUsernameAndPassword(String username, String password){
        try{
            String sql = "SELECT * FROM [dbo].[Users] WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                User a = new User();
                a.setUser_id(rs.getInt(1));
                a.setUsername(rs.getString(2));
                a.setPassword(rs.getString(3));
                a.setEmail(rs.getString(4));
                a.setName(rs.getString(5));
                a.setRole_id(rs.getInt(6));
                a.setAddress(rs.getString(7));
                a.setPhone_no(rs.getString(8));
            }
        }catch(SQLException e){
            
        }
        return null;
    }
    
    public List<User> getFullUser(){
        List<User> uList = new ArrayList<>();
        try{
            String sql = "SELECT * FROM [dbo].[Users]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                User a = new User();
                a.setUser_id(rs.getInt(1));
                a.setUsername(rs.getString(2));
                a.setPassword(rs.getString(3));
                a.setEmail(rs.getString(4));
                a.setName(rs.getString(5));
                a.setRole_id(rs.getInt(6));
                a.setAddress(rs.getString(7));
                a.setPhone_no(rs.getString(8));
                uList.add(a);
            }
        }catch (Exception e) {
        }
        return uList;
    }
}
