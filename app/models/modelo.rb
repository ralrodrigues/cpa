class Modelo < ActiveRecord::Base
  belongs_to :questionario
  has_many :topicos, dependent: :destroy

  amoeba do
    enable
  end

  validates :nome, presence: true, if: :global_docente?, if: :global_discente?, if: :turma_docente?, if: :turma_dicente?, if: :global_tae?

  def global_docente?
    nome == "Global Docente"
  end

  def global_discente?
    nome == "Global Discente"
  end

  def turma_dicente?
    nome == "Turma Dicente"
  end
  
  def turma_docente?
    nome == "Turma Docente"
  end
  
  def global_tae?
    nome == "Global TAE"
  end

end