class Pergunta < ActiveRecord::Base
  belongs_to :topico
  has_many :respostas

  amoeba do
    enable
  end
  
end
