/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.Auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import constant.IconstantFB;
import java.io.IOException;
import models.FacebookUser;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author AD
 */
public class GetFacebook {

    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(IconstantFB.FACEBOOK_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
       .add("client_id", IconstantFB.FACEBOOK_CLIENT_ID)
                        .add("client_secret", IconstantFB.FACEBOOK_CLIENT_SECRET)
                        .add("redirect_uri", IconstantFB.FACEBOOK_REDIRECT_URI)
                        .add("code", code)
                        .build()
                )
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }
     public static FacebookUser getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = IconstantFB.FACEBOOK_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        FacebookUser fbAccount= new Gson().fromJson(response, FacebookUser .class);
        return fbAccount;
    }
}
