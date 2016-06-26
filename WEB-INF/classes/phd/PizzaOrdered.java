
package phd;

public class PizzaOrdered {

    private Pizza pizza;
    private String size;
    private int quantity;

    public PizzaOrdered(Pizza pizza, String size, int quantity) {
        this.pizza = pizza;
        this.size = size;
        this.quantity = quantity;
    }

    public Pizza getPizza() {
        return pizza;
    }

    public void setPizza(Pizza pizza) {
        this.pizza = pizza;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPizzaTotal() {
        this.pizza.setSize(this.size);
        return this.pizza.getAmount() * this.quantity;
    }

}
