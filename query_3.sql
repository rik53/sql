-- Сделки по продаже акций сделаные трейдерами в возрасте от 18 до 35 лет
 SELECT 
    CONCAT(pi.firstname, ' ', pi.lastname) AS id_name,
    pi.country,
    stock_tools_id_stock_tools,
    os.rate,
    os.quantity,
    os.total,
    os.volume,
    TIMESTAMPDIFF(YEAR,
        pi.date_of_birth,
        NOW()) AS age
FROM
    orders_stock_asc os
        JOIN
    profile_indiv pi ON pi.user_id = os.user_id
HAVING age BETWEEN 18 AND 35
ORDER BY age;