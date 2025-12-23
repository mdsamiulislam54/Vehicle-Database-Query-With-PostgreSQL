# Vehicle Booking System – SQL Queries Documentation

This document explains the purpose and usage of the SQL queries used in the **Vehicle Booking System**. Each query is written for PostgreSQL and demonstrates common real-world database operations such as joins, filtering, grouping, and subqueries.

---

## 📌 Query 1: Booking Details with Customer and Vehicle Info

### 🔍 Purpose

This query retrieves all booking records along with:

* Customer name
* Vehicle name
* Booking start date
* Booking end date
* Booking status

### 🧠 Explanation

* `booking` is joined with `users` to get customer details
* `booking` is joined with `vehicle` to get vehicle details
* Uses `INNER JOIN`, so only valid bookings are shown

### 🧾 SQL Query

```sql
SELECT
    b.booking_id,
    u.name AS "customer_name",
    v.name AS "vehicle_name",
    b.start_date,
    b.end_date,
    b.status
FROM booking AS b
INNER JOIN users AS u ON b.user_id = u.user_id
INNER JOIN vehicle AS v ON b.vehicle_id = v.vehicle_id;
```

---

## 📌 Query 2: Vehicles That Have Never Been Booked

### 🔍 Purpose

This query finds all vehicles that **do not have any booking records**.

### 🧠 Explanation

* Uses a `NOT EXISTS` subquery
* Checks if a vehicle ID does not appear in the `booking` table
* Useful for identifying unused or idle vehicles

### 🧾 SQL Query

```sql
SELECT *
FROM vehicle AS v
WHERE NOT EXISTS (
    SELECT 1
    FROM booking AS b
    WHERE v.vehicle_id = b.vehicle_id
);
```

---

## 📌 Query 3: Available Cars Only

### 🔍 Purpose

This query lists all vehicles that are:

* Currently available
* Of type **car**

### 🧠 Explanation

* Filters vehicles based on `status` and `type`
* Useful for showing cars ready for booking

### 🧾 SQL Query

```sql
SELECT *
FROM vehicle AS v
WHERE v.status = 'available'
  AND v.type = 'car';
```

---

## 📌 Query 4: Vehicles Booked More Than 3 Times

### 🔍 Purpose

This query finds vehicles that have been booked **more than 3 times**.

### 🧠 Explanation

* Joins `vehicle` and `booking` tables
* Groups results by vehicle name
* Uses `HAVING` to filter grouped data

### 🧾 SQL Query

```sql
SELECT
    v.name AS "vehicle_name",
    COUNT(*) AS "total_bookings"
FROM vehicle AS v
INNER JOIN booking AS b ON v.vehicle_id = b.vehicle_id
GROUP BY v.name
HAVING COUNT(*) > 3;
```

> ⚠️ **Note:** If vehicle names are not unique, it is better to group by `vehicle_id` as well.

---

## ✅ Summary

These queries cover:

* Multi-table joins
* Subqueries with `NOT EXISTS`
* Filtering with `WHERE`
* Aggregation with `GROUP BY` and `HAVING`

They are commonly used in real-world booking or rental management systems.

---

📘 *Prepared for learning and practice purposes*
