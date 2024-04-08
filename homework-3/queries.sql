-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)
SELECT  customers.company_name AS customer, CONCAT(first_name, ' ', last_name) AS employee FROM orders
INNER JOIN customers USING(customer_id)
INNER JOIN employees USING(employee_id)
WHERE customers.city IN ('London') AND employees.city IN ('London')
GROUP BY  customer, employee, orders.ship_via
HAVING ship_via = 2

-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.
SELECT product_name, units_in_stock, suppliers.company_name, suppliers.contact_name, suppliers.phone FROM products
INNER JOIN suppliers USING(supplier_id)
WHERE discontinued <> 1 AND units_in_stock < 25
GROUP BY product_name, units_in_stock, suppliers.company_name, suppliers.contact_name, suppliers.phone, category_id
HAVING category_id IN (2,4)
ORDER BY units_in_stock
-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа
SELECT company_name FROM customers
EXCEPT
SELECT  company_name FROM orders
LEFT JOIN customers USING(customer_id)

-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
SELECT  product_name FROM products
WHERE EXISTS (SELECT * FROM order_details WHERE order_details.quantity=10 AND products.product_id=order_details.product_id)