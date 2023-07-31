SELECT c.CustomerID, CONCAT(c.CustomerFirstName, " ", c.CustomerLastName) AS FullName, o.OrderID, o.OrderTotalCost AS TotalCost,
       m.MenuCuisine AS Menu, i.ItemName AS Course
FROM customers c INNER JOIN bookings b USING(CustomerID) INNER JOIN orders o USING(BookingID)
     INNER JOIN items i USING(ItemID) INNER JOIN menus m USING(MenuID)
WHERE o.OrderTotalCost > 150;
 