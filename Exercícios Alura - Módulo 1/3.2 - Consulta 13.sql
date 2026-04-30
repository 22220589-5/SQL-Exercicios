-- Consulta 13: Identificar o total de disciplinas por turma

select
	turmas.nome_turma as Turma,
    count(disciplinas.id_disciplina) as Qtde_Disciplinas
from 
	disciplinas join professores on disciplinas.id_professor_fk = professores.id_professor
    join turmas on turmas.id_professor_fk = professores.id_professor
group by
	Turma;
