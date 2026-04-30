-- Consulta 9: Listar os Alunos e as disciplinas em que estão matriculados

-- Lista os alunos ordenando pelo nome deles e as disciplinas cursadas
select 
	alunos.nome_aluno, disciplinas.nome_disciplina
from
	turma_alunos join alunos on turma_alunos.id_aluno_fk = alunos.id_aluno
    join turma_disciplinas on turma_alunos.id_turma_fk = turma_disciplinas.id_turma_fk
    join disciplinas on turma_disciplinas.id_disciplina_fk = disciplinas.id_disciplina
order by
	alunos.nome_aluno;
