-- Mostre a quantidade de vendas por ano, mostrando em cada ano como foram as vendas
-- nos meses de janeiro, novembro e dezembro

select year(data_venda) as Ano, month(data_venda) as Mes, count(id_venda) as Quantidade from vendas
group by Ano, Mes
having Mes in ('01', '11', '12')
order by Ano, Mes;

/*
Resultado:
Ano - Mes - Quantidade
2020 - 1 - 1070
2020 - 11 - 1628
2020 - 12 - 1151
2021 - 1 - 1653
2021 - 11 - 2471
2021 - 12 - 1625
2022 - 1 - 2252
2022 - 11 - 3200
2022 - 12 - 2252
2023 - 1 - 1598
*/
