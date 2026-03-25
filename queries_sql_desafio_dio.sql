use ecommerce_desafio;

-- Quantos pedidos foram feitos por cada cliente
SELECT 
    CONCAT(c.Fname, ' ', c.Lname) AS NomeCompleto,
    COUNT(o.idOrder) AS total_pedidos
FROM clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient;


-- Algum vendedor também é fornecedor?
SELECT 
    se.SocialName AS vendedor,
    su.SocialName AS fornecedor,
    se.CNPJ
FROM seller se
JOIN supplier su ON se.CNPJ = su.CNPJ;

-- Relação de produtos, fornecedores e estoques
SELECT 
    p.Pname,
    s.SocialName AS fornecedor,
    ps.quantity AS quantidade_fornecida,
    st.storageLocation,
    st.quantity AS quantidade_estoque
FROM product p
JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
JOIN supplier s ON s.idSupplier = ps.idPsSupplier
LEFT JOIN storageLocation sl ON sl.idLproduct = p.idProduct
LEFT JOIN productStorage st ON st.idProdStorage = sl.idLstorage;

-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT 
    s.SocialName AS fornecedor,
    p.Pname AS produto
FROM supplier s
JOIN productSupplier ps ON s.idSupplier = ps.idPsSupplier
JOIN product p ON p.idProduct = ps.idPsProduct;

-- Status e rastreio das entregas
SELECT 
    o.idOrder,
    d.trackingCode,
    d.deliveryStatus
FROM delivery d
JOIN orders o ON o.idOrder = d.idOrder;

-- Clientes PF e PJ
SELECT c.Fname, c.Lname, pf.CPF
FROM clients c
JOIN clientPF pf ON pf.idClientPF = c.idClient;

SELECT c.Fname, c.Lname, pj.CNPJ
FROM clients c
JOIN clientPJ pj ON pj.idClientPJ = c.idClient;

-- Quais pedidos foram pagos em dinheiro?
SELECT idOrder, idOrderClient, orderStatus
FROM orders
WHERE paymentCash = TRUE;

-- Listar os produtos ordenados pela melhor avaliação
SELECT Pname, category, avaliacao
FROM product
ORDER BY avaliacao DESC;

-- Quais fornecedores fornecem mais de 300 unidades no total?
SELECT 
    s.SocialName,
    SUM(ps.quantity) AS total_fornecido
FROM supplier s
JOIN productSupplier ps ON s.idSupplier = ps.idPsSupplier
GROUP BY s.idSupplier
HAVING SUM(ps.quantity) > 300;

-- Quantos pedidos foram feitos por cada cliente?
SELECT 
    CONCAT(c.Fname, ' ', c.Lname) AS NomeCompleto,
    COUNT(o.idOrder) AS total_pedidos
FROM clients c
LEFT JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient;

-- Calcular o valor total dos itens de cada pedido (quantidade × avaliação)
SELECT 
    o.idOrder,
    SUM(po.poQuantity * p.avaliacao) AS total_itens
FROM orders o
JOIN productOrder po ON po.idPOorder = o.idOrder
JOIN product p ON p.idProduct = po.idPOproduct
GROUP BY o.idOrder;

-- Listar os produtos do mais caro (maior avaliação) para o mais barato
SELECT Pname, avaliacao
FROM product
ORDER BY avaliacao DESC;

-- Quais fornecedores entregaram mais de 500 unidades no total?
SELECT 
    s.SocialName,
    SUM(ps.quantity) AS total_fornecido
FROM supplier s
JOIN productSupplier ps ON ps.idPsSupplier = s.idSupplier
GROUP BY s.idSupplier
HAVING SUM(ps.quantity) > 500;

-- Relação completa de produtos, fornecedores e estoques
SELECT 
    p.Pname,
    s.SocialName AS fornecedor,
    ps.quantity AS quantidade_fornecida,
    st.storageLocation,
    st.quantity AS quantidade_estoque
FROM product p
JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
JOIN supplier s ON s.idSupplier = ps.idPsSupplier
LEFT JOIN storageLocation sl ON sl.idLproduct = p.idProduct
LEFT JOIN productStorage st ON st.idProdStorage = sl.idLstorage;

-- Listar todos os pedidos com nome do cliente e status da entrega
SELECT 
    o.idOrder,
    CONCAT(c.Fname, ' ', c.Lname) AS NomeCompleto,
    d.trackingCode,
    d.deliveryStatus
FROM orders o
JOIN clients c ON c.idClient = o.idOrderClient
LEFT JOIN delivery d ON d.idOrder = o.idOrder;
