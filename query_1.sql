-- Запрос для определегия того, какой продукт и в какой день недели лучше всего покупают
SELECT 
    DAYNAME(oc.`data`) AS weekday, `name`, COUNT(*) AS cnt
FROM
    orders_frx_bid_corp oc
        LEFT JOIN
    orders_frx_bid o ON oc.user_id = o.user_id
        LEFT JOIN
    frx_tools t ON t.id_frx_tools = oc.frx_tools_id_frx_tools
        OR oc.frx_tools_id_frx_tools = t.id_frx_tools
GROUP BY weekday , `name`
ORDER BY cnt DESC
LIMIT 1
;


