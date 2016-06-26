
package phd;

import java.util.*;
import java.sql.*;
import java.util.Map.Entry;
import static phd.myDatabase.closeConnection;
import static phd.myDatabase.createConnection;


public class Order {

    private int order_id, uid;
    Pizza temp;
    public static ArrayList<PizzaOrdered> pizzasX;

    public static HashMap<Pizza, Integer> pizzas;
    private Double totalAmount;
    private String orderStatus;
    private java.util.Date orderDate;

    public Order() {
        pizzas = new HashMap();
        pizzasX = new ArrayList();
    }

    public static ArrayList<PizzaOrdered> getPizzasX() {
        return pizzasX;
    }

    public static void setPizzasX(ArrayList<PizzaOrdered> pizzasX) {
        Order.pizzasX = pizzasX;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public HashMap<Pizza, Integer> getPizzas() {
        return pizzas;
    }

    public void setPizzas(HashMap<Pizza, Integer> pizzas) {
        this.pizzas = pizzas;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public String getOrderStatus() {
        Connection c = createConnection();
        Statement s = null;
        String q = "select orderstatus from orders where oid=" + this.order_id;
        ResultSet rs = null;
        String message = "ABC";
        try {
            s = c.createStatement();
            rs = s.executeQuery(q);
            if (rs.next()) {
                message = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println("Error " + e);
        } finally {
            closeConnection(c);
        }
        return message;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public java.util.Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(java.util.Date orderDate) {
        this.orderDate = orderDate;
    }

    public void removeFromOrder(Pizza pizzaX, String size) {
        this.temp = new Pizza();
        temp = pizzaX;
        temp.setSize(size);
        temp.setAmount();

        for (Pizza pizza : this.pizzas.keySet()) {
            if (pizza.getPid() == temp.getPid() && pizza.getSize() == temp.getSize()) {
                this.pizzas.put(pizza, this.pizzas.get(pizza) + 1);
                return;
            }
        }

        this.pizzas.put(temp, 1);
    }

    public void calcTotal() {
        this.totalAmount = 0.0;
        for (PizzaOrdered pizza : this.pizzasX) {
            totalAmount += pizza.getPizzaTotal();
        }
    }

    int placeOrder() {
        Connection c = createConnection();
        Statement s = null;
        int res = 0;
        java.text.SimpleDateFormat sdf
                = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.orderDate = new java.util.Date();
        String currentTime = sdf.format(orderDate);
        String q = "insert into orders (uid,orderdate,orderstatus,amount) values ('" + uid + "','" + currentTime + "','Order Placed','" + totalAmount + "')";
        try {
            s = c.createStatement();
            res = s.executeUpdate(q, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = s.getGeneratedKeys();
            if (rs.next()) {
                this.order_id = rs.getInt(1);
                this.orderStatus = "Order Placed";
            }
            System.out.println(res + " rows added to table");
        } catch (SQLException e) {
            System.out.println("Error " + e);
        } finally {
            closeConnection(c);
        }
        return res;
    }

    public void addToOrder(Pizza newpizza) {
        System.out.println("Pizza received- " + newpizza.getName() + newpizza.getSize() + "\n\n");
        boolean flag = false;
        if (!pizzasX.isEmpty()) {
            for (PizzaOrdered temp : pizzasX) {
                if (temp.getPizza().getPid() == newpizza.getPid() && temp.getSize().equals(newpizza.getSize())) {
                    temp.setQuantity(temp.getQuantity() + 1);
                    flag = true;
                }
            }
        } else {
            pizzasX.add(new PizzaOrdered(newpizza, newpizza.getSize(), 1));
            flag = true;
        }

        if (!flag) {
            pizzasX.add(new PizzaOrdered(newpizza, newpizza.getSize(), 1));
        }

        System.out.println("-------------------------");
        for (PizzaOrdered temp : pizzasX) {

            System.out.println(temp.getPizza().getName() + temp.getSize() + temp.getQuantity());
        }
        System.out.println("-------------------------");

    }

}
