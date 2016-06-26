package phd;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

public class Pizza {

    int pid;
    private String name, type, description, image, size;
    private HashMap price;
    private Double amount;

    static public ArrayList<Pizza> pizzasList = null;

    public Pizza(int pid, String name, String type, String description, String image, HashMap price) {
        this.pid = pid;
        this.name = name;
        this.type = type;
        this.description = description;
        this.image = image;
        this.price = price;
    }

    public Pizza(int pid, String size) {
        this.pid = pid;
        this.size = size;
    }
    
    

    public Pizza() {
    }

    public String getSize() {
        return size;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount() {
        this.amount = (Double) price.get(this.size);
    }

    public void setSize(String size) {
        this.size = size;
        this.setAmount();
    }

    public HashMap getPrice() {
        return price;
    }

    public void setPrice(HashMap price) {
        this.price = price;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

   

    @Override
    public boolean equals(Object obj) {
        System.out.println("In equals");
        if (obj instanceof Pizza) {
            Pizza pp = (Pizza) obj;
            return (pp.amount==this.amount && pp.pid == this.pid);
        } else {
            return false;
        }
       
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 83 * hash + this.pid;
        hash = 83 * hash + Objects.hashCode(this.amount);
        return hash;
    }
    
    

}
