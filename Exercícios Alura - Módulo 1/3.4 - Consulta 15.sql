-- Consulta 15: Porcentagem dos alunos que estão aprovados por disciplina

with Alunos_Por_Disciplina as (
	select
		disciplinas.nome_disciplina as Disciplinas,
		count(alunos.id_aluno) as Qtde_Alunos_Total
	from
		alunos join notas on alunos.id_aluno = notas.id_aluno_fk
		join disciplinas on disciplinas.id_disciplina = notas.id_disciplina_fk
	group by
		Disciplinas
),
Alunos_Aprovados as (
	select
		disciplinas.nome_disciplina as Disciplinas_Aprovados,
        count(alunos.id_aluno) as Qtde_Alunos_Aprovados
	from
		alunos join notas on alunos.id_aluno = notas.id_aluno_fk
        join disciplinas on disciplinas.id_disciplina = notas.id_disciplina_fk
	where
		notas.valor_nota >= 7
	group by
		Disciplinas_Aprovados
)
select
	Disciplinas,
    Qtde_Alunos_Total as Total_Alunos,
    Qtde_Alunos_Aprovados as Alunos_Aprovados,
    concat(round((Qtde_Alunos_Aprovados/Qtde_Alunos_Total)*100, 2), '%') as Porcentagem_Aprovados
from 
	Alunos_Por_Disciplina left join Alunos_Aprovados on Alunos_Por_Disciplina.Disciplinas = Alunos_Aprovados.Disciplinas_Aprovados;
    
/*
Resultado:

Disciplinas - Total-Alunos - Alunos_Aprovados - Porcentagem_Aprovados
Matemática - 10 - 5 - 50%
História - 10 - 2 - 20%
Física - 10 - 3 - 30%
Química - 10 - 3 - 30%
Inglês - 10 - 3 - 30%

*/
