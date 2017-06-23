package com.testsystem.table;

/**
 * 定义所有登录的表单格式
 * 
 * @author william
 *
 */
public class UserTable implements java.io.Serializable{
	
	
	// Fields    

    private String username;
    private String password;


   // Constructors

   /** default constructor */
   public UserTable() {
   }

   
   /** full constructor */
   public UserTable(String password) {
       this.password = password;
   }

  
   // Property accessors

   public String getUsername() {
       return this.username;
   }
   
   public void setUsername(String username) {
       this.username = username;
   }

   public String getPassword() {
       return this.password;
   }
   
   public void setPassword(String password) {
       this.password = password;
   }

}
