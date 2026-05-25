# Sales-Analysis-SQL

Exploratory Data Analysis Sales Project Using SQL

Este Projecto foi desenvolvido para simular o dia a dia de um Analista de Dados, focandos-se na extração, transformação e exploração dos dados de negócio. O Dataset contem o histórico de transações de vendas de uma empresa global, incluindo informações sobre valores faturados, quantidades vendidas, categoria de produtos, canais de distribuição e regiões de vendas. 

Passo 1: Data Profilling: 
Antes de inicia qualquer análise ou responder qualquer pergunta de negócio, realizei o processo de exploração de dados, diretamente no MYSQL Workbench para avaliar a qualidade e integridade dos dados. Os Principais pontos identificados foram: 

**Valores Nulos (Missing Values):** Foi feita uma contagem detalhada e verificou-se que a tabela 'Sales_Raw' possui 0 valores na coluna de faturação ('Sales_Amount') o que demontra que a base de dados está consistente para cálculos financeiros.

**Análise de Extremos (Outliers):** A quantidade mínima de produtos vendidos é de 1 unidade, confirmando que não existem valores negativos ou impossíveis no histórico que pudessem distorcer as médias.

**Consistência de Texto:** As categorias de produtos ('Product_Category') e os canais de venda ('Sales_Channel') foram validados e não apresentam dublicados por erros de digitação, permitindo agrupamentos precisos.
