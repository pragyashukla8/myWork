package controller;

import java.io.IOException;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

import javax.swing.JOptionPane;

import com.jfoenix.controls.JFXCheckBox;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;

import entities.User;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import models.A_DatabaseCommunicationEngine;
import models.ApplicationUser;
import utility.ApplicationUtilities;
import utility.BCrypt;

/**
 * *************************************************************************************************
 * Class		: LoginController		
 * Description	: LoginController to controller Login Screen
 *								
 * @author HARSHIT KUMAR 			
 * Date			    : 30 November, 2017
 * Source File name	: LoginController.java       	
 * **************************************************************************************************
 *
*/


public class LoginController  implements Initializable {


	@FXML
	private JFXTextField username;

	@FXML
	private JFXPasswordField password;

	@FXML
	private Label error;

	@FXML
	private JFXCheckBox admin;

	ApplicationUtilities util;

	public LoginController() {
		util = new ApplicationUtilities();
	}

	@FXML
	public void handleCloseButtonAction(ActionEvent event) {
		util.close(event);
	}

/**
 ************************************************************************************************
 * This Login Function is used to allow access to user to enter the application.
 * It checks from the Database if the user credentials are correct or not.
 * Moreover it controls which screen to populate for the guest user based on its assigned roles.
 * **********************************************************************************************
 * @param event
 */
	public void Login(ActionEvent event) {
		A_DatabaseCommunicationEngine DCE = new A_DatabaseCommunicationEngine();
		User guest = null;

		try {
			String username = this.username.getText();
			String password = this.password.getText();

			/*********************Check if user name is left blank or empty*************************/
			if(username == null || username.trim().equals("")) {
				error.setText("Username Cannot be empty or spaces");
				return;
			}

			/**********************Check if password is left blank or empty*************************/
			if(password == null || password.trim().equals("")) {
				error.setText("Password Cannot be empty or spaces");
				return;
			}


			String SQLQuery = "SELECT * FROM LOGIN WHERE USERNAME='"+username+"'";
			ResultSet resultSet = DCE.getResultSet(SQLQuery);
			ResultSet rs = resultSet;


			/************************CREATE A GUEST ENTITIY FROM SQL RESULT************************/
			while(rs.next())
				guest = new User(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						(rs.getString(4).equals("Y")? true : false), 
						rs.getString(5), 
						rs.getString(6), 
						rs.getString(7),
						rs.getInt(8)
						);

			/******Check if  is user name exists or not*******/
			if(guest == null) {
				error.setText("Username cannot be found");
				return;
			}

			// Check that an unencrypted password matches one that has
			// previously been hashed
			if (BCrypt.checkpw(password.trim(), guest.getPassword()))
				System.out.println("It matches");
			else {
				error.setText("Username and Password dont match");
			return;
			}
			
//			if(!guest.getPassword().equals(password.trim())) {
//				error.setText("Username and Password dont match");
//				return;
//			} 

			try {
				Stage primaryStage = new Stage();
				Parent root = null;
				new ApplicationUser(guest);
				if(guest.getAdmin() && admin.isSelected()) {
					System.out.println("Opening Admin view");
					/*****************If user is admin, inflate admin view*****************************/
					((Stage)(((Button)event.getSource()).getScene().getWindow())).close();
					root = (AnchorPane)FXMLLoader.load(getClass().getResource("/view/Admin.fxml"));
					primaryStage.initStyle(StageStyle.UNDECORATED);
					primaryStage.centerOnScreen();
				} else {
					if(!guest.getAdmin() && admin.isSelected())
					{
						error.setText( username + "does not have admin authorization. Please login as normal user.");
						return;
					}

					if(guest.getRoleid()==5)
					{
						System.out.println("Opening Admin by default view");
						/*****************If user is CSR, inflate CSR view***********************/
						((Stage)(((Button)event.getSource()).getScene().getWindow())).close();
						root = (AnchorPane)FXMLLoader.load(getClass().getResource("/view/Admin.fxml"));
						primaryStage.initStyle(StageStyle.UNDECORATED);
						primaryStage.centerOnScreen();
					}
					
					else if(guest.getRoleid()==4)
					{
						System.out.println("Opening CSR view");
						/*****************If user is CSR, inflate CSR view***********************/
						((Stage)(((Button)event.getSource()).getScene().getWindow())).close();
						root = (AnchorPane)FXMLLoader.load(getClass().getResource("/view/CSRScreen.fxml"));
						primaryStage.initStyle(StageStyle.UNDECORATED);
						primaryStage.centerOnScreen();
					}
					else if(guest.getRoleid()==3)
					{
						System.out.println("Opening Manager view");
						/*****************If user is CSR, inflate CSR view***********************/
						((Stage)(((Button)event.getSource()).getScene().getWindow())).close();
						root = (AnchorPane)FXMLLoader.load(getClass().getResource("/view/Manager.fxml"));
						primaryStage.initStyle(StageStyle.UNDECORATED);
						primaryStage.centerOnScreen();
					}
					
					else {
						System.out.println("Opening Customer view");
						/*****************If user is customer, inflate customer view***********************/
						((Stage)(((Button)event.getSource()).getScene().getWindow())).close();
						root = (AnchorPane)FXMLLoader.load(getClass().getResource("/view/Customer.fxml"));
						primaryStage.initStyle(StageStyle.UNDECORATED);
						primaryStage.centerOnScreen();
					}
				}
				Scene scene = new Scene(root);
				primaryStage.setScene(scene);
				primaryStage.centerOnScreen();
				primaryStage.show();
			} catch(Exception e) {
				System.out.println("Error occured while inflating view: " + e);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

/***************************************************************************************************
 * This function is called to navigate user to Sign up Form on the Login Page. 
 * *************************************************************************************************
 * @param event
 */
	@FXML
	public void signup(ActionEvent event) {
		((Stage)(((Button)event.getSource()).getScene().getWindow())).close();
		try {
			Stage primaryStage = new Stage();
			Parent root = FXMLLoader.load(getClass().getResource("/View/SignUpForm.fxml"));
			Scene scene = new Scene(root);
			primaryStage.setScene(scene);
			primaryStage.initStyle(StageStyle.UNDECORATED);
			primaryStage.centerOnScreen();
			primaryStage.show();
		} catch (IOException e) {
			System.out.println("Unable to open the Sign up Page. More Details:");
			JOptionPane.showMessageDialog(null, e.getMessage());
			System.out.println(e.getMessage());
		}
	}

/**************************************************************************************************
 * 	To initialize any screen elements (if any)
 **************************************************************************************************
 */
	@Override
	public void initialize(URL arg0, ResourceBundle arg1) {
	}

}
