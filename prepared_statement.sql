PREPARE GetOrderDetail FROM 
"SELECT o.OrderID, o.OrderQuantity, o.OrderTotalCost
 FROM orders o INNER JOIN bookings b USING(BookingID)
 WHERE b.CustomerID = ?";