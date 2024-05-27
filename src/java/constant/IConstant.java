/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package constant;

/**
 *
 * @author AD
 */
public class IConstant {
    //generate password 
    public static final String LOWERCASE_CHARACTERS = "abcdefghijklmnopqrstuvwxyz";
    public static final String UPPERCASE_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    public static final String NUMERIC_CHARACTERS = "0123456789";
    public static final String SPECIAL_CHARACTERS = "!@#$%^&*()-_=+[]{}|;:'<>,.?/";
    
    
    public static final String REGEX_PHONE_NUMBER = "^\\d{10}$";
    public static final String REGEX_PASSWORD = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$";
    public static final String REGEX_EMAIL = "^[\\w-\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
    public static final String REGEX_NAME = "^[A-Za-z ]+$";
}
