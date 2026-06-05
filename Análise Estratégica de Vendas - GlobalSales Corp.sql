-- ==============================================================================
-- PROJETO SQL: Análise Estratégica de Vendas - GlobalSales Corp
-- Autor: MARCELINO ALBINO
-- Objetivo: Transformar Dados Transacionais Brutos em Inteligência de Negócio
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- Pergunta 1: Quais são os canais de venda  utilizados pela empresa e quantas transações foram realizadas em cada um?
-- Objetivo: Identificar a relevância de cada canal (Online vs. Retail) para direcionar esforços de marketing.
-- ------------------------------------------------------------------------------
SELECT Sales_Channel, COUNT(*) AS "Total de Transações"
FROM Sales_Project.Sales
GROUP BY Sales.Sales_Channel;


-- ------------------------------------------------------------------------------
-- Pergunta 2: Qual é o valor total faturado  por cada região  onde a empresa atua?
-- Objetivo: Entender a distribuição geográfica da receita para apoiar decisões logísticas e de expansão.
-- ------------------------------------------------------------------------------
SELECT Sales_Reps.Region, SUM(Sales.Sales_Amount) "Total Faturado"
From Sales
INNER JOIN Sales_Reps ON Sales_Reps.Sales_Rep = Sales.Sales_Rep
GROUP BY Region;


-- ------------------------------------------------------------------------------
-- Pergunta 3:Qual é a média de desconto aplicada aos produtos de cada categoria?
-- Objetivo: Avaliar se alguma categoria está a depender demasiado de promoções para ser vendida.
-- ------------------------------------------------------------------------------
SELECT Products.Product_Category, AVG(Discount) AS "Média de Desconto"
FROM Sales
INNer JOIN Products ON Products.Product_ID = Sales.Product_ID
GROUP BY Product_Category;


-- ------------------------------------------------------------------------------
-- Pergunta 4:qual é a Categoria de Produto que gerou o maior valor total de faturação?
-- Objetivo: Descobrir o principal motor de receita da empresa para focar os investimentos em stock.
-- ------------------------------------------------------------------------------
SELECT Products.Product_Category, SUM(Sales_Amount) As "Maior Valor Total de Faturação"
FROM Sales
INNER JOIN Products ON Products.Product_ID = Sales.Product_ID
GROUP BY Product_Category
ORDER BY SUM(Sales_Amount) DESC
LIMIT 1;


-- ------------------------------------------------------------------------------
-- Pergunta 5:Qual é o ranking dos vendedores e o valor total de vendas de cada um?
-- Objetivo: Criar um ranking de equipa para apoiar o cálculo de bónus e comissões de fim de ano.
-- ------------------------------------------------------------------------------
SELECT Sales_Reps.Sales_Rep, SUM(Sales_Amount) AS "Valor Faturado Por Vendedor"
FROM Sales
INNER JOIN Sales_Reps ON Sales_Reps.Sales_Rep = Sales.Sales_Rep
GROUP BY Sales_Rep
ORDER BY SUM(Sales_Amount) DESC;


-- ------------------------------------------------------------------------------
-- Pergunta 6:Faz uma listagem que mostre o ID de todos os produtos do catálogo  
-- e a quantidade total de vezes que cada um aparece na tabela de vendas 
-- Se um produto nunca tiver sido vendido, ele deve aparecer na lista com valor zero ou nulo.
-- Objetivo: Identificar "stock parado" ou produtos que possam estar com erros de preço no sistema.
-- ------------------------------------------------------------------------------
SELECT Products.Product_ID, COUNT(Products.Product_ID)
FROM Products
LEFT JOIN Sales ON Products.Product_ID = Sales.Product_ID
GROUP BY Product_ID;


-- ------------------------------------------------------------------------------
-- Pergunta 7:Mostra apenas os vendedores que conseguiram faturar um total acumulado superior a 1.000.000€.
-- Objetivo: Filtrar o grupo de "Elite" da força de vendas para uma campanha de reconhecimento.
-- ------------------------------------------------------------------------------
SELECT Sales_Rep, SUM(Sales_Amount)
FROM Sales
GROUP BY Sales_Rep
HAVING SUM(Sales_Amount) > 1000000
ORDER BY SUM(Sales_Amount) DESC;


-- ------------------------------------------------------------------------------
-- Pergunta 8:Classificação Estratégica de Transações
-- Objetivo: Segmentar o volume de vendas para entender se o negócio depende de poucas vendas grandes ou de muitas vendas pequenas.
-- ------------------------------------------------------------------------------
SELECT Sale_ID, Sales_Amount,
CASE
    WHEN Sales_Amount > 7500 THEN "Grande Porte"
    WHEN Sales_Amount BETWEEN 2500 AND 7500 THEN "Médio Porte"
ELSE "Pequeno Porte" 
END AS "Dimensão de Negócio"
FROM Sales;


-- ------------------------------------------------------------------------------
-- Pergunta 9:O Filtro de Categoria sem JOIN
-- Objetivo: Demonstrar competência técnica no isolamento de dados através de subqueries.
-- ------------------------------------------------------------------------------
SELECT *
FROM Sales
WHERE Product_ID IN (
SELECT Product_ID
FROM Products
WHERE Product_Category = 'Electronics'
);


-- ------------------------------------------------------------------------------
-- Pergunta 10:Transações Acima da Média Geral
-- Objetivo: Identificar compras excecionais (outliers positivos) para análise de comportamento de clientes.

SELECT Sale_ID, Sales_Amount
FROM Sales
WHERE Sales_Amount > (
SELECT AVG(Sales_Amount)
FROM Sales
);