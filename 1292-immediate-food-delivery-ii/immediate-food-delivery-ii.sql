/* Write your T-SQL query statement below */
select convert(decimal(10,2), 

	(select count(delivery_type)*100.00
	from(
			select *, DENSE_RANK() over (partition by customer_id order by order_date) as rnk,
			case when order_date = customer_pref_delivery_date then 'immediate' else 'scheduled' end as delivery_type
			from Delivery
		)a
	where rnk = 1 and delivery_type = 'immediate'
	)
	/
	(
	select count(DISTINCT customer_id)
	from(
			select *, DENSE_RANK() over (partition by customer_id order by order_date) as rnk,
			case when order_date = customer_pref_delivery_date then 'immediate' else 'scheduled' end as delivery_type
			from Delivery
		) a
	)
) as immediate_percentage 