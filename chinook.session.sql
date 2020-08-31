-- 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

SELECT c.CustomerId, c.FirstName, c.LastName, c.Country
FROM Customer c
WHERE Country != "USA";

-- 2. Provide a query only showing the Customers from Brazil.

SELECT c.CustomerId, c.FirstName, c.LastName, c.Country
FROM Customer c
WHERE Country = "Brazil";

-- 3. Provide a query showing the Invoices of customers who are from Brazil. 
-- The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

SELECT c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate, i.BillingCountry
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE c.Country = "Brazil";

SELECT i.InvoiceId, i.InvoiceDate, i.BillingCountry, c.FirstName, c.LastName
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
WHERE c.Country = "Brazil";

-- 4. Provide a query showing only the Employees who are Sales Agents.

SELECT * FROM Employee WHERE Title = "Sales Support Agent";

-- 5. Provide a query showing a unique/distinct list of billing countries from the Invoice table.

SELECT * FROM Invoice GROUP BY BillingCountry ORDER BY BillingCountry;

-- 6. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT e.FirstName, e.LastName, i.InvoiceId, i.InvoiceDate, i.Total
FROM Employee e
JOIN Customer c ON c.SupportRepId = e.EmployeeId
JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE e.Title = "Sales Support Agent";

-- 7. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

SELECT i.Total AS "Invoice Total", c.FirstName AS "Customer First Name", c.LastName AS "Customer Last Name", c.Country, e.FirstName AS "Sales Agent First Name", e.LastName AS "Sales Agent Last Name"
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId;

-- 8. How many Invoices were there in 2009 and 2011?

SELECT Count(InvoiceDate) AS "Total Number of Invoices from 2009"
FROM Invoice
WHERE InvoiceDate LIKE '%2009%';

SELECT Count(InvoiceDate) AS "Total Number of Invoices from 2011"
FROM Invoice
WHERE InvoiceDate LIKE '%2011%';

-- 9. What are the respective total sales for each of those years?

SELECT Sum(Total) as "2009 Total Invoiced Amount"
FROM Invoice
WHERE InvoiceDate LIKE '%2009%';

SELECT Sum(Total) as "2011 Total Invoiced Amount"
FROM Invoice
WHERE InvoiceDate LIKE '%2011%';

-- 10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.

SELECT Count() as "Total Number of Line Items"
FROM InvoiceLine i
WHERE i.InvoiceId = 37;

-- 11. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.

SELECT Count() as "Total Number of Line Items", InvoiceId
FROM InvoiceLine i
GROUP BY InvoiceId;

-- 12. Provide a query that includes the purchased track name with each invoice line item.

SELECT t.Name, i.InvoiceId
FROM InvoiceLine i
JOIN Track t ON i.TrackId = t.TrackId;

-- 13. Provide a query that includes the purchased track name AND artist name with each invoice line item.

SELECT t.Name AS "Track Name", a.Name AS "Artist Name", i.InvoiceId
FROM InvoiceLine i
JOIN Track t ON i.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist a ON al.ArtistId = a.ArtistId;

-- 14. Provide a query that shows the # of invoices per country.

SELECT Count() AS "Total Invoices Per Country", BillingCountry
FROM Invoice
GROUP BY BillingCountry
ORDER BY BillingCountry;

-- 15. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be included on the resultant table.

SELECT p.name, Count() AS "Number of Tracks"
FROM Playlist p
JOIN PlaylistTrack pt ON p.PlaylistId = pt.PlaylistId
GROUP BY pt.PlaylistId;

-- 16. Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

SELECT t.Name AS "Track Title", a.Name AS "Artist Name", al.Title AS "Album Title", m.Name AS "Media Type", g.Name AS "Genre"
FROM Track t
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN MediaType m ON t.MediaTypeId = m.MediaTypeId
JOIN Artist a ON al.ArtistId = a.ArtistId
JOIN Genre g ON t.GenreId = g.GenreId;

-- 17. Provide a query that shows all Invoices but includes the # of invoice line items.

SELECT i.InvoiceId, i.InvoiceDate, Count() AS "Number of Line Items"
FROM Invoice i
JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
GROUP BY il.Invoiceid;

--18. Provide a query that shows total sales made by each sales agent.

SELECT e.FirstName, e.LastName, Sum(i.Total) AS "Total Sales"
FROM Employee e
JOIN Customer c ON e.EmployeeId = c.SupportRepId
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY e.EmployeeId;

-- 19. Which sales agent made the most in sales in 2009?