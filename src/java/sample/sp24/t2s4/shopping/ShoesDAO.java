/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.sp24.t2s4.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.sp24.t2s4.utils.DBUtils;
/**
 *
 * @author quy duc
 */
public class ShoesDAO {

    private static final String CHECK = "SELECT productID FROM products WHERE productID = ? AND quantity >= ?";
    private static final String GET_QUANTITY = "SELECT quantity FROM products WHERE productID = ?";
    private static final String INSERT_ORDER = "INSERT INTO [order](userID, date, total) VALUES (?,GETDATE(),0)";
    private static final String INSERT_ORDER_DETAIL = "INSERT INTO [orderDetail](orderID,productID,quantity,price) VALUES (?,?,?,?)";
    private static final String GET_ALL = "SELECT * FROM [products]";
    private static final String COUNT = "SELECT COUNT(*) FROM [order]";
    private static final String SET_TOTAL = "UPDATE [order] SET total = ? WHERE orderID = ?";
    private static final String SET_PRODUCT_QUANTITY = "UPDATE products SET quantity = ? WHERE productID = ?";

    public boolean checkQuantity(String id, int quantity) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK);
                ptm.setString(1, id);
                ptm.setInt(2, quantity);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public int getQuantity(String id) throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_QUANTITY);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    quantity = rs.getInt("quantity");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return quantity;
    }

    public int createOrder(String userID) throws SQLException { //return OrderID
        int generatedId = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDER);
                ptm.setString(1, userID);
                ptm.executeUpdate();
                ptm = conn.prepareStatement(COUNT);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    generatedId = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return generatedId;
    }

    public boolean insertCartIntoOrderDetail(Cart cart, int orderID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                float total = 0;
                ptm = conn.prepareStatement(INSERT_ORDER_DETAIL);
                for (Shoes shoes : cart.getCart().values()) {
                    ptm.setInt(1, orderID);
                    ptm.setString(2, shoes.getId());
                     ptm.setInt(3, shoes.getQuantity());
                    ptm.setFloat(4, Float.parseFloat(shoes.getPrice().toString()  ))  ;
                    check = ptm.executeUpdate()> 0 ? true : false;
                    total += shoes.getPrice()*shoes.getQuantity();
                }
                if (check) { //set total for order
                     ptm = conn.prepareStatement(SET_TOTAL);
                     ptm.setFloat(1, total);
                     ptm.setInt(2, orderID);
                     check = ptm.executeUpdate()> 0 ? true : false;
                }
                if (check) { //change the quantity for product 
                    for (Shoes shoes : cart.getCart().values()) {
                        int currentQuantity = getQuantity(shoes.getId());
                        ptm =  conn.prepareStatement(SET_PRODUCT_QUANTITY);
                        ptm.setInt(1, currentQuantity - shoes.getQuantity());
                        ptm.setString(2, shoes.getId());  
                        check = ptm.executeUpdate()> 0 ? true : false;
                    }
                }
            }
        } catch (Exception e) {
           e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public List<Shoes> getAllProduct() throws SQLException{
        List<Shoes> listItems = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL);
                rs = ptm.executeQuery();
                 while(rs.next()) {
                    String id = rs.getString("productID");
                    String name = rs.getString("name");
                    double price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    Shoes shoes = new Shoes(id, name, price, quantity);
                    listItems.add(shoes);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listItems;
    }
}
