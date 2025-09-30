-- 1. Print the average price of all furniture that is not listed as rustic or traditional.
-- 2. Show the names of customers who rented furniture but haven’t returned it yet.
-- 3. Determine the furniture with the maximum rental cost and print the dates when it was
-- rented, no matter if it’s been returned. No date must appear more than once.
-- 4. Find out how many customers who rented furniture use Gmail (their email ends with
-- “gmail.com”) and show the number.
-- 5. Show the names and phone numbers of customers who rented only traditional furniture.

SELECT AVG(price) AS avg_price
FROM Furniture
WHERE style NOT IN ('rustic', 'traditional');

