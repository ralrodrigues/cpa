json.array!(@usuarios) do |usuario|
  json.extract! usuario, :nome, :senha, :tipo, :faixa_etaria, :area_id
  json.url usuario_url(usuario, format: :json)
end
