/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package constant;

import constant.IConstant;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author AD
 */
public class Validate {

    public static final boolean isValidName(String name) {
//      Sử dụng Pattern để biên dịch biểu thức chính quy IConstant.REGEX_NAME.
//      Sử dụng Matcher để kiểm tra xem chuỗi name có khớp với biểu thức chính quy hay không.
        Pattern pattern = Pattern.compile(IConstant.REGEX_NAME);
        Matcher matcher = pattern.matcher(name);
        return matcher.matches();
    }

    public static final boolean isValidEmail(String email) {
        Pattern pattern = Pattern.compile(IConstant.REGEX_EMAIL);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public static final boolean isValidPhoneNumber(String phoneNumber) {
        Pattern pattern = Pattern.compile(IConstant.REGEX_PHONE_NUMBER);
        Matcher matcher = pattern.matcher(phoneNumber);
        return matcher.matches();
    }

    public static final boolean isNumber(String numberStr) {
        Pattern pattern = Pattern.compile(IConstant.REGEX_NUMBER);
        Matcher matcher = pattern.matcher(numberStr);
        return matcher.matches();
    }

    public static final boolean isValidPassword(String password) {
        Pattern pattern = Pattern.compile(IConstant.REGEX_PASSWORD);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }
}
