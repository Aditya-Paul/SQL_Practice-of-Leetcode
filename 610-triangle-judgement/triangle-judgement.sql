/* Write your T-SQL query statement below */
select x,y,z,
case  
	when x+y>z and y+z>x and x+z>y then 'Yes'
	else 'No'
End as triangle
from Triangle