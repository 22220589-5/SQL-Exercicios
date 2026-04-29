-- Criação de uma tabela com os nomes dos fornecedores em colunas e a relação por mês e ano das vendas

select 
	Ano, 
    Mes,
    sum(case when Nome_Fornecedor = 'AstroSupply' then Quantidade else 0 end) as Quantidade_AstroSupply, -- ID 1
    sum(case when Nome_Fornecedor = 'HorizonDistributors' then Quantidade else 0 end) as Quantidade_HorizonDistributors, -- ID 2
    sum(case when Nome_Fornecedor = 'EchoLogistics' then Quantidade else 0 end) as Quantidade_EchoLogistics, -- ID 3
    sum(case when Nome_Fornecedor = 'CosmicConnections' then Quantidade else 0 end) as Quantidade_CosmicConnections, -- ID 4
    sum(case when Nome_Fornecedor = 'TerraTrade' then Quantidade else 0 end) as Quantidade_TerraTrade, -- ID 5
    sum(case when Nome_Fornecedor = 'PinnaclePartners' then Quantidade else 0 end) as Quantidade_PinnaclePartners, -- ID 6
	sum(case when Nome_Fornecedor = 'NebulaNetworks' then Quantidade else 0 end) as Quantidade_Nebula, -- ID 7
    sum(case when Nome_Fornecedor = 'OceanicOrigins' then Quantidade else 0 end) as Quantidade_OceanicaOrigins, -- ID 8
    sum(case when Nome_Fornecedor = 'SummitSolutions' then Quantidade else 0 end) as Quantidade_SummitSolutions, -- ID 9
    sum(case when Nome_Fornecedor = 'InfinityImports' then Quantidade else 0 end) as Quantidade_InfinityImports -- ID 10
from (
	select
		year(vendas.data_venda) as Ano, 
        month(vendas.data_venda) as Mes,
		fornecedores.nome_fornecedor as Nome_Fornecedor,
		count(*) as Quantidade
	from
		fornecedores join produtos on fornecedores.id_fornecedor = produtos.id_fornecedor_fk
		join itens_venda on produtos.id_produto = itens_venda.id_produto_fk
		join vendas on vendas.id_venda = itens_venda.id_venda_fk
	group by
		Ano, Mes, Nome_Fornecedor
	order by
		Ano, Mes
) as subq
group by Ano, Mes;

/*
Resultado:

Ano,Mes,Quantidade_AstroSupply,Quantidade_HorizonDistributors,Quantidade_EchoLogistics,Quantidade_CosmicConnections,Quantidade_TerraTrade,Quantidade_PinnaclePartners,Quantidade_Nebula,Quantidade_OceanicaOrigins,Quantidade_SummitSolutions,Quantidade_InfinityImports
2020,1,576,640,425,391,204,195,193,170,213,213
2020,2,304,309,177,214,110,112,90,96,106,128
2020,3,328,295,218,222,91,111,96,119,92,116
2020,4,325,312,218,208,101,113,106,85,105,93
2020,5,471,460,309,341,169,164,165,159,167,180
2020,6,302,306,206,200,114,108,95,84,81,108
2020,7,312,293,205,204,94,89,99,95,105,106
2020,8,333,311,194,227,106,95,84,96,90,128
2020,9,315,342,233,209,107,112,106,101,88,114
2020,10,242,308,213,243,106,99,106,91,82,111
2020,11,889,860,637,617,314,309,307,305,326,307
2020,12,610,657,415,418,228,226,211,200,246,232
2021,1,941,932,627,639,302,288,319,277,281,340
2021,2,525,434,310,328,134,160,145,146,150,154
2021,3,439,452,320,297,158,136,148,155,135,160
2021,4,445,503,315,319,171,175,148,158,144,189
2021,5,667,678,455,491,215,224,224,225,212,242
2021,6,510,441,327,327,137,127,146,116,155,170
2021,7,457,497,377,326,157,180,159,156,157,170
2021,8,480,452,323,289,134,168,158,151,146,164
2021,9,467,469,304,272,171,157,160,146,156,165
2021,10,447,448,333,319,157,136,147,163,136,172
2021,11,1412,1448,937,962,432,456,455,445,452,479
2021,12,948,913,573,625,312,324,305,276,327,314
2022,1,1229,1259,849,815,449,406,406,410,410,444
2022,2,613,632,432,391,205,229,177,179,177,204
2022,3,629,650,408,424,198,176,206,215,191,231
2022,4,590,636,420,410,214,198,204,206,228,216
2022,5,894,970,645,646,304,320,282,308,305,300
2022,6,605,594,442,437,179,209,215,183,218,199
2022,7,616,576,408,412,185,205,193,188,190,193
2022,8,621,598,402,405,198,206,192,177,193,192
2022,9,584,562,391,411,177,190,175,185,193,200
2022,10,597,628,436,464,198,228,175,216,222,237
2022,11,1830,1735,1246,1314,583,599,529,606,595,666
2022,12,1350,1284,896,867,408,429,414,375,394,461
2023,1,847,928,614,618,285,303,324,299,311,342
2023,2,478,439,295,311,156,145,163,119,147,170
2023,3,523,464,333,349,154,175,159,154,152,154
2023,4,427,453,299,302,134,160,128,135,141,169
2023,5,729,693,455,447,217,255,209,231,236,249
2023,6,396,432,300,292,162,143,141,151,151,160
2023,7,459,442,298,287,137,146,145,148,138,143
2023,8,413,438,269,280,141,133,137,121,131,156
2023,9,418,449,304,273,143,140,135,146,151,145
2023,10,429,440,287,336,155,160,139,149,149,169

*/
