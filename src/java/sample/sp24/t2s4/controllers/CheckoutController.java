/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.sp24.t2s4.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdk.nashorn.internal.ir.RuntimeNode;
import sample.sp24.t2s4.shopping.Cart;
import sample.sp24.t2s4.shopping.Shoes;
import sample.sp24.t2s4.shopping.ShoesDAO;
import sample.sp24.t2s4.user.UserDTO;

@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final String ERROR = "viewCart.jsp";
    private static final String SUCCESS = "shopping.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession(false);
            if (session != null) {
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null) { //check cart is exist or not
                    boolean checkCartEmpty = cart.getCart().isEmpty();
                    if (!checkCartEmpty) { //check cart has product or not
                        ShoesDAO dao = new ShoesDAO();
                        boolean checkQuantity = true;
                        for (Shoes shoes : cart.getCart().values()) {
                            if (!dao.checkQuantity(shoes.getId(), shoes.getQuantity())) {
                                checkQuantity = false; //k du so luong
                                shoes.setQuantity(dao.getQuantity(shoes.getId()));
                            }
                        }
                        if (checkQuantity) { 
                            String userID = ((UserDTO)session.getAttribute("LOGIN_USER") ).getUserID();
                            //qrpqay
                            int orderID = dao.createOrder( userID );
                            if (orderID != 0) {
                               boolean checkInsertOrder = dao.insertCartIntoOrderDetail(cart, orderID);
                                if (checkInsertOrder) {
                                    request.setAttribute("THANKYOU", "THANK FOR YOUR PURCHASE!");
                                    session.setAttribute("CART", null);
                                    url = SUCCESS;
                                }else{
                                     request.setAttribute("ERROR", "Insert Order Details fail!");
                                }
                            }else{
                                request.setAttribute("ERROR", "Insert Order fail!");
                            }
                            
                        }else{
                            request.setAttribute("ERROR", "Chung toi da set lai so luong san pham phu hop voi kho");
                        }
                    } else {
                        request.setAttribute("ERROR", "Your cart is empty");
                    }
                } else {
                    request.setAttribute("ERROR", "Your cart is empty");
                }
            } else {
                response.sendRedirect("login.html");
            }
        } catch (Exception e) {
            log("Error at CheckoutController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
