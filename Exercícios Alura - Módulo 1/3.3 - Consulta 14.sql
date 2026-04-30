-- Consulta 14: Porcentagem de alunos aprovados (média ≥ 7), considerando todos os alunos

with Quantidade_De_Alunos_Aprovados as (
select
	count(alunos.id_aluno) as Qtde_Alunos_Aprovados
from 
	alunos join notas on alunos.id_aluno = notas.id_aluno_fk
where
	notas.valor_nota >= '7.0'
),
Total_Alunos as (
select
	count(id_aluno_fk) as Qtde_Alunos_Total
from
	notas
)
select
	concat(round((Qtde_Alunos_Aprovados/Qtde_Alunos_Total)*100, 2), '%') as Porcentagem_Alunos_Aprovados
from
	Quantidade_De_Alunos_Aprovados, Total_Alunos;

-- Resultado: 32% de Alunos Aprovados
