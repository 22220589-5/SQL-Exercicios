-- Mostre a quantidade de linhas por tabela de todas as tabelas

SELECT COUNT(*) as Quantidade, 'Categorias' as Tabela FROM categorias
UNION ALL
SELECT COUNT(*) as Quantidade, 'Clientes' as Tabela FROM clientes
UNION ALL
SELECT COUNT(*) as Quantidade, 'Fornecedores' as Tabela FROM fornecedores
UNION ALL
SELECT COUNT(*) as Quantidade, 'ItensVenda' as Tabela FROM itens_venda
UNION ALL
SELECT COUNT(*) as Quantidade, 'Marcas' as Tabela FROM marcas
UNION ALL
SELECT COUNT(*) as Quantidade, 'Produtos' as Tabela FROM produtos
UNION ALL
SELECT COUNT(*) as Quantidade, 'Vendas' as Tabela FROM vendas;
