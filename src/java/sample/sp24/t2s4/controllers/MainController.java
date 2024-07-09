/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.sp24.t2s4.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hoanv
 */
public class MainController extends HttpServlet {

    private static final String WELCOME="login.html";
    
    private static final String LOGIN="Login";
    private static final String LOGIN_CONTROLLER="LoginController";
    private static final String SEARCH="Search";
    private static final String SEARCH_CONTROLLER="SearchController";
    private static final String UPDATE="Update";
    private static final String UPDATE_CONTROLLER="UpdateController";
    private static final String DELETE="Delete";
    private static final String DELETE_CONTROLLER="DeleteController";
    private static final String LOGOUT="Logout";
    private static final String LOGOUT_CONTROLLER="LogoutController";
    private static final String CREATE_USER_PAGE="Create_User_Page";
    private static final String CREATE_USER_PAGE_VIEW="createUser.html";
    private static final String CREATE="Create";
    private static final String CREATE_CONTROLLER="CreateController";
    private static final String SHOPPING_PAGE="Shopping_Page";
    private static final String SHOPPING_PAGE_VIEW="shopping.html";
    private static final String ADD="Add";
    private static final String ADD_CONTROLLER="AddController";
    private static final String VIEW="View";
    private static final String VIEW_PAGE="viewCart.jsp";
    private static final String EDIT="Edit";
    private static final String EDIT_CONTROLLER="EditController";
    private static final String REMOVE="Remove";
    private static final String REMOVE_CONTROLLER="RemoveController";
    private static final String CHECKOUT="Checkout";
    private static final String CHECKOUT_CONTROLLER="CheckoutController";

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=WELCOME;
        try {
            String action= request.getParameter("action");
           
            if(LOGIN.equals(action)){
                url=LOGIN_CONTROLLER;
            } else if(SEARCH.equalsIgnoreCase(action)) {
                url = SEARCH_CONTROLLER;
            }else if(UPDATE.equalsIgnoreCase(action)) {
                url = UPDATE_CONTROLLER;
            }else if(DELETE.equalsIgnoreCase(action)){
                url = DELETE_CONTROLLER;
            }else if(LOGOUT.equalsIgnoreCase(action)){
                url = LOGOUT_CONTROLLER;
            }else if (CREATE_USER_PAGE.equalsIgnoreCase(action)){
                url= CREATE_USER_PAGE_VIEW;
            }else if(CREATE.equalsIgnoreCase(action)){
                url=CREATE_CONTROLLER;
            }else if(SHOPPING_PAGE.equalsIgnoreCase(action)){
                url=SHOPPING_PAGE_VIEW;
            }else if(ADD.equalsIgnoreCase(action)){
                url=ADD_CONTROLLER;
            }else if(VIEW.equalsIgnoreCase(action)){
                url=VIEW_PAGE;
            }else if(EDIT.equalsIgnoreCase(action)){
                url=EDIT_CONTROLLER;
            }
            else if(REMOVE.equalsIgnoreCase(action)){
                url=REMOVE_CONTROLLER;
            }
            else if(CHECKOUT.equalsIgnoreCase(action)){
                url=CHECKOUT_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
