class Topico < ActiveRecord::Base
  belongs_to :modelo
  has_many :perguntas, dependent: :destroy

  amoeba do
    enable
  end
  
end
