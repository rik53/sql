-- Этим запросом вывели информацию о трейдерах которые совершили больше 1 сделки
SELECT 
    user_id,
    CONCAT(firstname, ' ', lastname) AS `name`,
    `account`,
    balance
FROM
    mydb.profile_indiv
WHERE
    user_id IN (SELECT 
            user_id
        FROM
            (SELECT 
                user_id, COUNT(*) AS cnt
            FROM
                mydb.orders_stock_bid
            GROUP BY user_id
            HAVING cnt > 1
            ORDER BY cnt DESC) t);