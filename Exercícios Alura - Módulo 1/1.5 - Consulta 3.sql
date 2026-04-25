-- Consulta 3: Buscar apenas os alunos que fazem aniversário em fevereiro

-- Forma 1:
select nome_aluno from alunos
where data_nascimento_aluno like '____-02-__'; -- o sublinhado no operador like força a necessidade de existir um caractere

--Forma 2:
select nome_aluno from alunos
where month(data_nasciment_aluno) = '02'; -- year(), month(), day() usamos no mysql

/*Resultado:
Carolina Oliveira
Fernanda Lima*/
