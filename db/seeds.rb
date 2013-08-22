# ruby encoding: utf-8

# Mayor.create(name: 'Emanuel', city: cities.first)

# CPA Configuração
questionarios = Questionario.create([
	{ nome: 'Configuração', 
		inicio_votacao: 	Time.now, 
		previsao_termino: Time.now, 
		termino_votacao: 	Time.now }
])

# Áreas
areas = Area.create([
	{nome: 'Edificações',												 questionario: questionarios.first},
	{nome: 'Gestão Empresarial', 								 questionario: questionarios.first},
	{nome: 'Informática', 											 questionario: questionarios.first},
	{nome: 'Licenciatura', 											 questionario: questionarios.first},
	{nome: 'Recursos Naturais', 								 questionario: questionarios.first},
	{nome: 'Centro de Tecnologia da Informação', questionario: questionarios.first}
])

# Professores e TAEs
professores = Funcionario.create([
	# Edificações
	{nome: "Adriano Aurélio Ribeiro Barbosa", 			area_id: areas.first.id},
	{nome: "Carlos Augusto Niemeyer", 							area_id: areas.first.id},
	{nome: "Francisco Fabbro Neto", 								area_id: areas.first.id},
	{nome: "João Dalton Daibert", 									area_id: areas.first.id},
	{nome: "Johanatan Wagner Rodriguez", 						area_id: areas.first.id},
	{nome: "José Américo Alves Salvador Filho", 		area_id: areas.first.id},
	{nome: "Julio César Pereira Salgado", 					area_id: areas.first.id},
	{nome: "Nicole de Castro Pereira", 							area_id: areas.first.id},
	{nome: "Pedro Augusto Pinheiro Fantinatti",			area_id: areas.first.id},
	{nome: "Silvete Mari Soares", 									area_id: areas.first.id},
	{nome: "Vassiliki Terezinha Galvão Boulomytis",	area_id: areas.first.id},
	# Gestão Empresarial
	{nome: "Érico da Silva Costa",									area_id: areas.second.id},
	{nome: "Ernesto Donizetti Aparecido da Silva",	area_id: areas.second.id},
	{nome: "Maria do Carmo Cataldi Muterle",				area_id: areas.second.id},
	{nome: "Marlette Cássia Oliveira Ferreira",			area_id: areas.second.id},
	{nome: "Paulo Ribeiro",													area_id: areas.second.id},
	{nome: "Ricardo Maroni Neto",										area_id: areas.second.id},
	{nome: "Roberto Costa Moraes",									area_id: areas.second.id},
	{nome: "Rodrigo Antônio dos Santos",						area_id: areas.second.id},
	{nome: "Tânia Cristina Lemes Soares Pontes",		area_id: areas.second.id},
	# Informática
	{nome: "Carlos Jair Coletto", 						area_id: areas.third.id},
	{nome: "Denny Paulista Azevedo Filho", 		area_id: areas.third.id},
	{nome: "Ederson Rafael Wagner", 					area_id: areas.third.id},
	{nome: "Eduardo Noboru Sasaki", 					area_id: areas.third.id},
	{nome: "Eduardo Pereira de Sousa", 				area_id: areas.third.id},
	{nome: "Glauco Bianchini", 								area_id: areas.third.id},
	{nome: "Henrique Gonçalves Salvador", 		area_id: areas.third.id},
	{nome: "Juliana Matheus Gregio Pereira", 	area_id: areas.third.id},
	{nome: "Lineu Fernando Stege Mialaret", 	area_id: areas.third.id},
	{nome: "Marilene Esquiavoni", 						area_id: areas.third.id},
	{nome: "Mario Tadashi Shimanuki", 				area_id: areas.third.id},
	{nome: "Nelson Alves Pinto", 							area_id: areas.third.id},
	{nome: "Renan Cavichi de Freitas", 				area_id: areas.third.id},
	{nome: "Wanderson Santiago dos Reis", 		area_id: areas.third.id},
	# Licenciatura	
	{nome: "Cristina Meyer", 																			area_id: areas.fourth.id},
	{nome: "Jaqueline Lopes", 																		area_id: areas.fourth.id},
	{nome: "Juliana Lucia do Amaral Molnr Garrido do Nascimento",	area_id: areas.fourth.id},
	{nome: "Luis Américo Monteiro Junior", 												area_id: areas.fourth.id},
	{nome: "Marcelo Rosa Hatugai", 																area_id: areas.fourth.id},
	{nome: "Márcio André Traesel", 																area_id: areas.fourth.id},
	{nome: "Marta Senghi Soares", 																area_id: areas.fourth.id},
	{nome: "Ricardo Roberto Plaza Teixeira",											area_id: areas.fourth.id},
	{nome: "Samuel Gomes Duarte",																	area_id: areas.fourth.id},
	# Recursos Naturais 
	{nome: "Janice Peixer", 						area_id: areas.fifth.id},
	{nome: "Samara Salamene", 					area_id: areas.fifth.id},
	{nome: "Shirley Pacheco de Souza",	area_id: areas.fifth.id}
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
    qtd_alunos: "40",
    questionario: questionarios.first,
    area: areas.third
  )
end

# Disciplinas
disciplinas_ads_1 = Disciplina.create([
	{
		nome: "Arquitetura de Computadores",
		sigla: "ADC A1",
		qtd_professores: "1",
		curso: cursos_ads.first
	},
	{
		nome: "Lógica de Programação",
		sigla: "LOP A1 ",
		qtd_professores: "2",
		curso: cursos_ads.first
	},
	{
		nome: "Comunicação e Expressão",
		sigla: "COE A1",
		qtd_professores: "1",
		curso: cursos_ads.first
	},
	{
		nome: "Inglês técnico",
		sigla: "ING A1",
		qtd_professores: "1",
		curso: cursos_ads.first
	},
	{
		nome: "História da Ciência e Tecnologia",
		sigla: "HCT A1",
		qtd_professores: "1",
		curso: cursos_ads.first
	},
	{
		nome: "Matemática Discreta I",
		sigla: "MD1 A1",
		qtd_professores: "1",
		curso: cursos_ads.first
	}
])

# Turmas
Turma.create([
	{sigla: "A/B", 	disciplina: disciplinas_ads_1[0],	funcionario: professores[31]},
	{sigla: "A", 		disciplina: disciplinas_ads_1[1], funcionario: professores[27]},
	{sigla: "B", 		disciplina: disciplinas_ads_1[1],	funcionario: professores[31]},
	{sigla: "A/B", 	disciplina: disciplinas_ads_1[2],	funcionario: professores[36]},
	{sigla: "A/B", 	disciplina: disciplinas_ads_1[3],	funcionario: professores[36]},
	{sigla: "A/B",	disciplina: disciplinas_ads_1[4],	funcionario: professores[28]},
	{sigla: "A/B",	disciplina: disciplinas_ads_1[5],	funcionario: professores[28]}
])

# Módulo Votação

# Modelos

	# Visibilidades :
		# Global - Docente  [todos professores respondem] 
		# Global - Discente [todos alunos respondem]
		# Turma - Docente   [professores avaliam suas turmas] 
		# Turma - Discente  [alunos avaliam suas turmas]
		# Global TAE

modelos = Modelo.create([
	{	nome: "QUANTO À BIBLIOTECA",
		visibilidade: "Global - Docente",	questionario: questionarios[0] },
])

# Tópicos
topicos = Topico.create([
	{ nome: "QUANTO À BIBLIOTECA", modelo: modelos[0] }
])

# Perguntas
perguntas = Pergunta.create([
	{ enunciado: "Organização e acesso ao acervo", 
		tipo: "INTEGER", topico: topicos[0] },
	{ enunciado: "Disponibilidade de material bibliográfico complementar", 
		tipo: "INTEGER", topico: topicos[0] },
	{ enunciado: "Acesso a Internet", 
		tipo: "BOOLEAN", topico: topicos[0] }
])