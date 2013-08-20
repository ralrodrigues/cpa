# ruby encoding: utf-8

# Mayor.create(name: 'Emanuel', city: cities.first)

questionarios = Questionario.create([
	{nome: 'Configuração'}
])

areas = Area.create([
	{nome: 'Edificações',												 questionario: questionarios.first},
	{nome: 'Gestão Empresarial', 								 questionario: questionarios.first},
	{nome: 'Informática', 											 questionario: questionarios.first},
	{nome: 'Licenciatura', 											 questionario: questionarios.first},
	{nome: 'Recursos Naturais', 								 questionario: questionarios.first},
	{nome: 'Centro de Tecnologia da Informação', questionario: questionarios.first}
])