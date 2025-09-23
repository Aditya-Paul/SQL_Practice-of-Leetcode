select t.product1_id , t.product2_id ,pinfo1.category as product1_category , pinfo2.category as product2_category , t.customer_count
from(
		select PP1.product_id as product1_id ,pp2.product_id as product2_id, count(PP1.product_id) as customer_count
		from ProductPurchases PP1
		cross join ProductPurchases Pp2
		where PP1.product_id != pp2.product_id and pp1.user_id = pp2.user_id and PP1.product_id < pp2.product_id
		group by PP1.product_id , pp2.product_id
	)t
join ProductInfo pinfo1 on product1_id = pinfo1.product_id
join ProductInfo pinfo2 on product2_id = pinfo2.product_id
where customer_count >= 3
order by t.customer_count desc, t.product1_id asc, t.product2_id asc