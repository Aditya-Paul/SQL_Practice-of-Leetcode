select  season,category, total_quantity, total_revenue
from(
		select  *,dense_rank () over (partition by season order by total_revenue desc) as dense_rnk2
		--season,category, total_quantity,total_revenue
		from(
			select * , dense_rank () over (partition by season order by total_quantity desc) as dense_rnk1
			from(
				select season,category, sum(quantity) as total_quantity, sum(summ)  as total_revenue 
				from(
						select sale.price, sale.quantity * sale.price as summ, sale.quantity, sale.sale_date, pro.category, case when DATEPART(MM,sale_date) = 1  THEN 'Winter'
									   when DATEPART(MM,sale_date) = 2  THEN 'Winter'
									   when DATEPART(MM,sale_date) = 12  THEN 'Winter'
									   when DATEPART(MM,sale_date) = 3  THEN 'Spring'
									   when DATEPART(MM,sale_date) = 4  THEN 'Spring'
									   when DATEPART(MM,sale_date) = 5  THEN 'Spring'
									   when DATEPART(MM,sale_date) = 6  THEN 'Summer'
									   when DATEPART(MM,sale_date) = 7  THEN 'Summer'
									   when DATEPART(MM,sale_date) = 8  THEN 'Summer'
									   when DATEPART(MM,sale_date) = 9  THEN 'Fall'
									   when DATEPART(MM,sale_date) = 10  THEN 'Fall'
									   when DATEPART(MM,sale_date) = 11  THEN 'Fall'
								  end as season
				  
						from sales sale
						join products pro
						on sale.product_id =  pro.product_id
						)t
				group by season,category
			)z
		)x
		where dense_rnk1 = 1
)c
where dense_rnk2 = 1