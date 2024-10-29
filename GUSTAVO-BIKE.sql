-- vamos lá pessoal vou fazer separadamente com titulo de cada consulta ok ? desde já agradeço.

-- LISTAR TODOS OS CLIENTES QUE NÃO TENHAM REALIZADO UMA COMPRA 

SELECT c.customer_id, c.first_name, c.last_name
FROM customers c 
LEFT JOIN orders o ON C.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- LISTAR OS PRODUTOS QUE NÃO TENHAM SIDO COMPRADOS 
SELECT p.product_id, p.product_name 
FROM producsts p 
LEFT JOIN order_items oi ON P.product_id = oi.product_id
WHERE oi.order_id IS NULL;

-- LISTAR OS PRODUTOS SEM ESTOQUE 

SELECT  P.PRODUCT_id, p.product_name 
FROM products p
LEFT JOIN stocks s ON p.product_id = s.product_id
WHERE s.quantity IS NULL OR s.quantity = 0;

-- AGRUPAR A QUANTIDADE DE VENDAS QUE UMA DETERMINADA MARCA

SELECT b.brand_name, st.store_id, SUM(oi.quantity) AS total_sold
FROM brands b 
JOIN products p ON b.brand_id = p.brand_id
JOIN order_items oi ON p.producst_id = oi.product_id 
JOIN orders o ON oi.order_id = o.order_id
JOIN stores st ON o.store_id = st.store_id
GROUP BY b.brand_name, st.store_id;


-- listar os funcionários que não estejam relacionados a um pedido 

SELECT s.staff_id, s.first_name, s.last_name
FROM staffs s 
LEFT JOIN orders o ON s.staff_id = o.staff_id
WHERE o.order_id IS NULL;
