SELECT ItemName
FROM items
WHERE ItemID = ANY (SELECT ItemID
                    FROM (SELECT ItemID, count(OrderID)
                          FROM orders
                          GROUP BY ItemID
                          HAVING count(OrderID) > 2) AS tmp
                    );