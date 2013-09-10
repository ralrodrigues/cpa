# ruby encoding: utf-8

# CPA CONFIGURAÇÃO
cpa_configuracao = Questionario.create
	({
		nome: 'Configuração', 
		inicio_votacao:		Time.now, 
		previsao_termino:	Time.now, 
		termino_votacao:	Time.now 
	})

# ÁREAS
areas = Area.create([
	{ 
		nome: 'Gestão Empresarial', 
		questionario: cpa_configuracao[0] 
	},
	{ 
		nome: 'Informática', 
		questionario: cpa_configuracao[0] 
	}
])

# PROFESSORES E TAEs
professores = Funcionario.create([
	# GESTÃO EMPRESARIAL
	{
		nome: "Érico da Silva Costa",									
		area_id: areas[1].id
	},
	{
		nome: "Marlette Cássia Oliveira Ferreira",
		area_id: areas[1].id
	},
	{
		nome: "Ricardo Maroni Neto",
		area_id: areas[1].id
	},
	{
		nome: "Tânia Cristina Lemes Soares Pontes",
		area_id: areas[1].id
	},
	# INFORMÁTICA
	{
		nome: "Carlos Jair Coletto",
		area_id: areas[2].id
	},
	{
		nome: "Denny Paulista Azevedo Filho",
		area_id: areas[2].id
	},
	{
		nome: "Ederson Rafael Wagner",
		area_id: areas[2].id
	},
	{
		nome: "Eduardo Noboru Sasaki",
		area_id: areas[2].id
	},
	{
		nome: "Henrique Gonçalves Salvador",
		area_id: areas[2].id
	},
	{
		nome: "Juliana Matheus Gregio Pereira", 	
		area_id: areas[2].id
	},
	{
		nome: "Lineu Fernando Stege Mialaret", 	
		area_id: areas[2].id
	},
	{
		nome: "Nelson Alves Pinto", 							
		area_id: areas[2].id
	},
	{
		nome: "Renan Cavichi de Freitas", 				
		area_id: areas[2].id
	}
])

professores.each do |professor|
	professor.update_attributes(:usuario_attributes => {:tipo => "Professor"})
end

# Cursos
cursos_ads = []
for i in 1..6
	cursos_ads << Curso.create(
		nome: "Tecnologia em Análise e Desenvolvimento de Sistemas",
    sigla: "ADS",
    nivel: "Superior",
    periodo: "Noturno",
    semestre_atual: i,
    semestres_duracao: "6",
    qtd_alunos: "10",
    questionario: cpa_configuracao[0],
    area: areas[1]
  )
end

# Disciplinas ADS 1
disciplinas_ads_1 = Disciplina.create([
	{	nome: "Arquitetura de Computadores", sigla: "ADC A1", 
		qtd_professores: "1", curso: cursos_ads[0] },
	{ nome: "Lógica de Programação", sigla: "LOP A1 ",
		qtd_professores: "2",	curso: cursos_ads[0]	},
	{ nome: "Comunicação e Expressão", sigla: "COE A1",
		qtd_professores: "1", curso: cursos_ads[0] },
	{ nome: "Inglês técnico", sigla: "ING A1",
		qtd_professores: "1",	curso: cursos_ads[0] },
	{ nome: "História da Ciência e Tecnologia", sigla: "HCT A1",
		qtd_professores: "1",	curso: cursos_ads[0]	},
	{ nome: "Matemática Discreta I", sigla: "MD1 A1",
		qtd_professores: "1", curso: cursos_ads[0]	}
])

# Turmas ADS 1
Turma.create([
	{sigla: "A/B", 	disciplina: disciplinas_ads_1[0],	funcionario: professores[31]},
	{sigla: "A", 		disciplina: disciplinas_ads_1[1], funcionario: professores[27]},
	{sigla: "B", 		disciplina: disciplinas_ads_1[1],	funcionario: professores[31]},
	{sigla: "A/B", 	disciplina: disciplinas_ads_1[2],	funcionario: professores[36]},
	{sigla: "A/B", 	disciplina: disciplinas_ads_1[3],	funcionario: professores[36]},
	{sigla: "A/B",	disciplina: disciplinas_ads_1[4],	funcionario: professores[28]},
	{sigla: "A/B",	disciplina: disciplinas_ads_1[5],	funcionario: professores[28]}
])

# # Módulo Votação

# # Modelos

# 	# Visibilidades :
# 		# Global - Docente  [todos professores respondem] 
# 		# Global - Discente [todos alunos respondem]
# 		# Turma - Docente   [professores avaliam suas turmas] 
# 		# Turma - Discente  [alunos avaliam suas turmas]
# 		# Global TAE

# modelos = Modelo.create([
# 	{	nome: "QUANTO À BIBLIOTECA",
# 		visibilidade: "Global - Docente",	questionario: cpa_configuracao[0] },
# ])

# # Tópicos
# topicos = Topico.create([
# 	{ nome: "QUANTO À BIBLIOTECA", modelo: modelos[0] }
# ])

# # Perguntas
# perguntas = Pergunta.create([
# 	{ enunciado: "Organização e acesso ao acervo", 
# 		tipo: "INTEGER", topico: topicos[0] },
# 	{ enunciado: "Disponibilidade de material bibliográfico complementar", 
# 		tipo: "INTEGER", topico: topicos[0] },
# 	{ enunciado: "Acesso a Internet", 
# 		tipo: "BOOLEAN", topico: topicos[0] }
# ])


# ('Avaliação Global do Corpo Docente' ,'Global_Docente' ,1);
# ('Avaliação do Corpo Docente sobre suas Aulas' ,'Turma_Docente' ,1);
# ('Avaliação Global do Corpo Discente' ,'Global_Discente' ,1);
# ('Avaliação do Corpo Discente sobre suas Aulas' ,'Turma_Dicente' ,1);
# ('Avaliação Global dos Técnicos Administrativos' ,'Global_TAE' ,1);
