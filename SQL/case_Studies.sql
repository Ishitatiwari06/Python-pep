USE shopnest;
-- case study 1
select c.first_name,o.order_id,o.order_date,p.product_name,oi.quantity,(oi.quantity*oi.unit_price) as line_total
from customers c join orders o on c.customer_id=o.customer_id
join order_items oi on oi.order_id=o.order_id
join products p on p.product_id=oi.product_id;

-- case study 2
