class Area < ActiveRecord::Base
  belongs_to :questionario
  belongs_to :funcionario
  has_many :funcionarios, dependent: :destroy

  amoeba do
    enable
  end
end
