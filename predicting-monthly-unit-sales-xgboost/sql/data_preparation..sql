1. create table sales_products AS
select 
	-- Sales table columns
	s.sales_id,
	s.order_id,
	s.customer_id,
	s.product_id,
	s.quantity_ordered,
	s.quantity_shipped,
	s.unit_price,
	s.discount_pct,
	s.sales_amount,
	s.cost_amount,
	s.gross_margin,
	s.return_flag,
    
    -- Customers table columns
	p.product_category,
	p.subcategory,
	p.vendor,
	p.brand,
	p.unit_cost,
	p.list_price,
	p.launch_date,
	p.product_status,
	p.discontinue_date
from sales AS s
join products AS p
	on s.product_id = p.product_id;
    
select * from sales_products
limit 5;

2.   -- Product Level Monthly Units and Revenue
    create table if not exists product_monthly_sales AS
    select
		product_id,
        date_format(order_date, '%Y-%M') AS month,
        sum(quantity_ordered) AS units_sold,
        sum(quantity_ordered * unit_price) AS revenue
	from sales_orders
    group by product_id, month;

