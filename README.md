# Sales-Analysis-SQL

Exploratory Data Analysis Sales Project Using SQL

O objetivo deste projeto é transformar dados transacionais brutos em inteligência de negócio. Utilizando a base de dados da GlobalSales Corp, procurei responder a 10 perguntas críticas da administração para avaliar a performance de vendas, comportamento de clientes, eficiência de produtos e dinâmica regional.

Passo 1: Data Profilling: 
Antes de inicia qualquer análise ou responder qualquer pergunta de negócio, realizei o processo de exploração de dados, diretamente no MYSQL Workbench para avaliar a qualidade e integridade dos dados. Os Principais pontos identificados foram: 

**Valores Nulos (Missing Values):** Foi feita uma contagem detalhada e verificou-se que a tabela 'Sales_Raw' possui 0 valores na coluna de faturação ('Sales_Amount') o que demontra que a base de dados está consistente para cálculos financeiros.

**Análise de Extremos (Outliers):** A quantidade mínima de produtos vendidos é de 1 unidade, confirmando que não existem valores negativos ou impossíveis no histórico que pudessem distorcer as médias.

**Consistência de Texto:** As categorias de produtos ('Product_Category') e os canais de venda ('Sales_Channel') foram validados e não apresentam dublicados por erros de digitação, permitindo agrupamentos precisos.
