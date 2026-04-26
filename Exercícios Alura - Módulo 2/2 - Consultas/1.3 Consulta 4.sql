-- Consulta 4: Busque o nome e cargo dos colaboradores que foram contratados entre 2022-01-01 e 2022-06-30

select id_colaborador, nome, cargo, data_contratacao from colaboradores
where data_contratacao between '2022-01-01' and '2022-06-30';

/*
Resultado: 4 colaboradores de id 1, 2, 4 e 6
*/
