/*Consulta 3: Buscar apenas os alunos que fazem aniversário em fevereiro.*/

select nome_aluno from alunos
where data_nascimento_aluno like '____-02-__'; /*o sublinhado no operador like força a necessidade de existir um caractere*/

/*Resultado:
Carolina Oliveira
Fernanda Lima*/
