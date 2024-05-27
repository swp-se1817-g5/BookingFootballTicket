/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author admin
 */
public class Status {
    private int id;
    private String name;
    private boolean display;

    public Status() {
    }

    public Status(int id, String name, boolean display) {
        this.id = id;
        this.name = name;
        this.display = display;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isDisplay() {
        return display;
    }

    public void setDisplay(boolean display) {
        this.display = display;
    }
    

    @Override
    public String toString() {
        return "Status{" + "id=" + id + ", name=" + name + ", display=" + display + '}';
    }

    
    
    
}
