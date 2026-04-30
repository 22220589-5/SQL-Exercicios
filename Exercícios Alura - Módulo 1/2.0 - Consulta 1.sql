/*Consulta 1: Retornar a média de Notas dos Alunos em história.*/

/*Maneira mais simples:
- Como história possui o id_disciplina = 2 na tabela disciplinas, fazemos um select com a cláusula simples: where id_disciplina_fk = 2*
- id_disciplina_fk é a coluna chave estrangeira que guarda a chave primária id_disciplina da tabela disciplinas
- Resultado = 3.603*/

select avg(valor_nota) from notas
where id_disciplina_fk = 2;


/*Maneira mais complexa:
- Fazemos um join das tabelas notas e disciplinas unindo-as com a cláusula ON
- aplicamos o filtro no where usando o nome da disciplina que tivemos acesso da tabela disciplinas
- Resultado = 3.603
*/

select avg(notas.valor_nota)
from notas join disciplinas
on notas.id_disciplina_fk = disciplinas.id_disciplina
where disciplinas.nome_disciplina = 'História';
