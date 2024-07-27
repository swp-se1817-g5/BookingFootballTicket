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
    public static final String REGEX_PHONE_NUMBER = "^0\\d{9}$";
    public static final String REGEX_NUMBER = "^\\d+$";
    public static final String REGEX_PASSWORD = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$";
    public static final String REGEX_EMAIL = "^[\\w-\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
    public static final String REGEX_NAME = "^(?!\\s*$)[A-Za-z\\d\\s\\W]+$";
}
