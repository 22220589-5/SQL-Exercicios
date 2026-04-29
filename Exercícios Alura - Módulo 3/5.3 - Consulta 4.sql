-- Consulta 04 - Qual o primeiro ano disponível na base?

select
	year(data_venda) as Ano
from 
	vendas
order by
	data_venda
LIMIT 1;
    
-- Resultado: Ano de 2020
