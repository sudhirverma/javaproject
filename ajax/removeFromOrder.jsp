<%@ page import="java.io.*" %><%@ page import="phd.*" %><%
	response.setContentType("text/xml");
        
        int pid=Integer.parseInt((String)request.getParameter("pid"));
        String size=(String)request.getParameter("size");
        Order order;
        
        out.println ("<?xml version=\"1.0\"?>");
        out.println ("<PizzaDetails>");
		
         if(request.getSession().getAttribute("UserOrder")!=null)
	{
			

            order=(Order)request.getSession().getAttribute("UserOrder");
	
			

        for(PizzaOrdered temp : order.getPizzasX())
        {
				
            if(temp.getPizza().getPid()==pid&&temp.getSize().equals(size))
            {
			
               if(temp.getQuantity()>1)
               {
                   temp.setQuantity(temp.getQuantity()-1);
                   
               }
               else
               {
					temp.setQuantity(temp.getQuantity()-1);
                   order.getPizzasX().remove(temp);
               }
			   order.calcTotal();
			   out.println ("<detail>"+temp.getQuantity()+"</detail>");
                           out.println ("<detail>"+temp.getPizzaTotal()+"</detail>");
                           out.println ("<detail>"+order.getTotalAmount()+"</detail>");
			   break;
               
            }
        }
        
            request.getSession().setAttribute("UserOrder", order);
        }
         else
         {
             out.print("0");
         }
    
    

    out.println ("</PizzaDetails>");
        
%>