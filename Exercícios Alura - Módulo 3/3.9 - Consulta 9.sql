-- Criação de uma tabela todos os fornecedores, suas vendas acumuladas e o % que suas vendas representam do total

select
	Fornecedor,
    Quantidade_Vendas,
    concat(round(Quantidade_Vendas/(select count(*) from itens_venda)*100,2), '%') as Porcentagem
from (
	select
		fornecedores.nome_fornecedor as Fornecedor,
		count(*) as Quantidade_Vendas
	from
		fornecedores join produtos on fornecedores.id_fornecedor = produtos.id_fornecedor_fk
		join itens_venda on produtos.id_produto = itens_venda.id_produto_fk
		join vendas on vendas.id_venda = itens_venda.id_venda_fk
	group by
		Fornecedor
	order by
		Quantidade_Vendas desc
) as subq;

/*
Resultado:

Fornecedor - Quantidade_Vendas - Porcentagem

HorizonDistributors - 28062 - 18.70%
AstroSupply - 28022 - 18.68%
CosmicConnections - 19179 - 12.78%
EchoLogistics - 19080 - 12.72%
InfinityImports - 9955 - 6.64%
PinnaclePartners - 9419 - 6.28%
TerraTrade - 9206 - 6.14%
SummitSolutions - 9175 - 6.12%
NebulaNetworks - 9020 - 6.01%
OceanicOrigns - 8916 - 5.94%
*/
