class Questionario < ActiveRecord::Base
	has_many :areas, dependent: :destroy
	has_many :cursos, dependent: :destroy
	has_many :modelos, dependent: :destroy

  amoeba do
    enable
  end

  validates :nome, length: {
    minimum: 3,
    maximum: 255,
    too_short: "deve ter pelo menos %{count} caracteres",
    too_long: "deve ter no máximo %{count} caracteres"
  }

	def Questionario.em_preparacao(questionarios)
		questionarios.select { |questionario| questionario.inicio_votacao.nil? }
	end

	def Questionario.em_votacao(questionarios)
	questionarios.select { |questionario| questionario.inicio_votacao && questionario.termino_votacao.nil? }
  end


  def Questionario.encerrados(questionarios)
  	questionarios.select { |questionario| questionario.inicio_votacao && questionario.termino_votacao }
  end

	def em_preparacao?
		inicio_votacao.nil? && termino_votacao.nil? ? true : false
	end

	def em_votacao?
		inicio_votacao && termino_votacao.nil? ? true : false
	end

	def encerrado?
		inicio_votacao && termino_votacao ? true : false
	end
	
	def iniciar_votacao
		begin
			# self.cursos.each do |curso|

			# 	alunos_do_curso = []

			# 	numero_do_aluno = 1
			# 	# Criando alunos do curso
			# 	curso.qtd_alunos.times do
			# 		alunos_do_curso << Usuario.create(nome: (curso.sigla + curso.semestre_atual.to_s +  curso.periodo.first + numero_do_aluno.to_s), senha: numero_do_aluno, tipo: "Discente")
			# 		numero_do_aluno = numero_do_aluno + 1
		 #            # Carregando Modelo global para Discentes
		 #            modelos = Modelo.includes(:questionario).where("questionarios.id" => self, "modelos.nome" => "Global Discente")
			#         modelos.each do |modelo|
			# 	        modelo.topicos.each do |topico|
			# 	            topico.perguntas.each do |pergunta|
			# 	            	Resposta.create(usuario: alunos_do_curso.last, pergunta: pergunta)
			# 	            end	
			#             end
		 #            end
			# 	end
		          
		#           #Colocando os alunos nas turmas
			# 	curso.disciplinas.each do |disciplina|
			# 		alunos_de_turma_count = curso.qtd_alunos / disciplina.qtd_professores
			# 		alunos_de_turma = alunos_do_curso.dup
			# 		disciplina.turmas.each do |turma|
			# 			for i in 0..(alunos_de_turma_count - 1)
			# 				aluno = alunos_de_turma.pop
			# 				Sala.create(usuario: aluno, turma: turma)
			# 				# Carregando Modelo turmas para os discentes
			# 				modelos = Modelo.includes(:questionario).where("questionarios.id" => self, "modelos.nome" => "Turma Dicente")
			# 		        modelos.each do |modelo|
			# 			        modelo.topicos.each do |topico|
			# 			            topico.perguntas.each do |pergunta|
			# 			            	Resposta.create(usuario: aluno, pergunta: pergunta, turma: turma)
			# 			            end	
			# 		            end
			# 	            end
			# 			end
			# 			# Carregando Modelo turmas para Docentes
			# 			modelos = Modelo.includes(:questionario).where("questionarios.id" => self, "modelos.nome" => "Turma Docente")
			# 		    modelos.each do |modelo|
			# 		        modelo.topicos.each do |topico|
			# 		            topico.perguntas.each do |pergunta|
			# 		            	professor_id = 1	
			# 		            	professores = Funcionario.where(:id => turma.professor_id)
			# 						professores.each do |professor|
			# 						   professor_id = professor.usuario_id
			# 						end
			# 		            	Resposta.create(usuario_id: professor_id, pergunta: pergunta, turma: turma)
			# 		            end	
			# 	            end
			#             end
			# 		end
			# 	end
			# end
			# Carregando Modelo global para Docentes
			docentes = Funcionario.includes(:usuario, :area).where("usuarios.tipo" => "Docente", "areas.questionario_id" => self)
			docentes.each do |docente|
		          modelos = Modelo.includes(:questionario).where("questionarios.id" => self, "modelos.nome" => "Global Docente")
		        modelos.each do |modelo|
			        modelo.topicos.each do |topico|
			            topico.perguntas.each do |pergunta|
			            	Resposta.create(usuario: docente.usuario, pergunta: pergunta)
			            end	
		            end
		          end
		      end
		      # Carregando Modelo global para TAES 
		      taes = Funcionario.includes(:usuario, :area).where("usuarios.tipo" => "TAE", "areas.questionario_id" => self)
			taes.each do |tae|
		          modelos = Modelo.includes(:questionario).where("questionarios.id" => self, "modelos.nome" => "Global TAE")
		        modelos.each do |modelo|
			        modelo.topicos.each do |topico|
			            topico.perguntas.each do |pergunta|
			            	Resposta.create(usuario: tae.usuario, pergunta: pergunta)
			            end	
		            end
		          end
		      end
		      # render text: self.cursos.methods.inspect
			# Definindo data de inicio de votacao e previsao de termino
			# self.update_attributes(inicio_votacao: Time.now, previsao_termino: Time.now.advance(:months => 1))    
    rescue => ex
      logger.error ex.message
    end 
	end

end