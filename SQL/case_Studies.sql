USE shopnest;
-- case study 1
select c.first_name,o.order_id,o.order_date,p.product_name,oi.quantity,(oi.quantity*oi.unit_price) as line_total
from customers c left join orders o on c.customer_id=o.customer_id
left join order_items oi on oi.order_id=o.order_id
left join products p on p.product_id=oi.product_id;

-- case study 2
SELECT
    c.customer_id,
    c.first_name,
    c.state,
    SUM(od.quantity * od.unit_price) AS total_spend
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN order_items od
    ON o.order_id = od.order_id
JOIN products p
    ON od.product_id = p.product_id
GROUP BY c.customer_id, c.first_name, c.state
HAVING SUM(od.quantity * od.unit_price) >
(
    SELECT AVG(total_spend)
    FROM
    (
        SELECT SUM(od.quantity * od.unit_price) AS total_spend
        FROM Orders o
        JOIN order_items od
            ON o.order_id = od.order_id
        JOIN products p
            ON od.product_id = p.product_id
        GROUP BY o.customer_id
    ) AS customer_totals
);

-- case 3
select p.category,sum(p.price*oi.quantity) as revenue from products p
join order_items oi on p.product_id=oi.product_id
group by p.category
having sum(p.price*oi.quantity)>50000 or sum(oi.quantity)<10;

-- case 4
create view finance_report as
select p.category,sum(p.price*oi.quantity) as revenue from products p
join order_items oi on p.product_id=oi.product_id
group by p.category
having sum(p.price*oi.quantity)>50000 or sum(oi.quantity)<10;

-- case 5
delimiter //
create procedure PlaceOrder(
	in p_customer_id int,
    in p_product_id int,
    in p_quantity int
)
begin
	declare v_order_id int;
    declare v_price decimal(10,2);
    declare v_stock int;
	
    select stock_qty,price
    into v_stock,v_price
    from products where product_id=p_product_id;
    
    if v_stock >= p_quantity then
		start transaction;
        -- insert into orders
        insert into orders(customer_id)
        values(p_customer_id);
        
        set v_order_id=last_insert_id();
        -- insert into order_items 
        insert into order_items(order_id,product_id,quantity,unit_price)
        values(v_order_id,p_product_id,p_quantity,v_price);
        
        -- reduce stock_qty
        update products
        set stock_qty=stock_qty-p_quantity
        where product_id=p_product_id;
        
        commit;
	else
		signal sqlstate '45000'
        set message_text="Insufficient stock";
	end if;
end //
delimiter ;

-- case 6
create table stock_audit(
	audit_id int primary key auto_increment,
    product_id int,
    old_stock int,
    new_stock int,
    changed_At timestamp default current_timestamp,
    changed_by varchar(100)
);
delimiter //
create trigger trg_audit_log
after update on products
for each row
begin
	if old.stock_qty <> new.stock_qty then
		insert into stock_audit(product_id,old_stock,new_stock,changed_by)
        values(new.product_id,old.stock_qty,new.stock_qty,current_user());
	end if;
end //
delimiter ;
update products
set stock_qty=50 where product_id=2;
select * from stock_audit;

-- case 7
-- 1
select c.customer_id,c.first_name,c.state,sum(oi.quantity*oi.unit_price) as total_spend,
dense_rank() over(partition by c.state order by sum(oi.quantity*oi.unit_price) desc) as spend_rank
from customers c
join orders o on o.customer_id=c.customer_id
join order_items oi on oi.order_id=o.order_id
group by c.customer_id,c.first_name,c.state;
-- 2
select o.order_date,sum(oi.quantity*oi.unit_price) as revenue,
sum(sum(oi.quantity*oi.unit_price)) over(order by o.order_date) as running_total
from orders o
join order_items oi on oi.order_id=o.order_id
group by o.order_date
order by o.order_date;
-- 3
select o.order_id,o.order_date,sum(oi.quantity*oi.unit_price) as order_value,
avg(sum(oi.quantity*oi.unit_price)) 
over(
order by o.order_date
rows between 2 preceding and current row
) as moving_avg
from orders o
join order_items oi on oi.order_id=o.order_id
group by o.order_id,o.order_date;

