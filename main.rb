require 'mechanize'
require 'json'

def fetch_cars(url)
  agent = Mechanize.new
  response = agent.get(url)
  parsed_response = JSON.parse(response.body)
  parsed_response['documentos']
end

def download_photo(photo_url, local_path)
  agent = Mechanize.new
  agent.get(photo_url).save(local_path)
end

def process_cars(cars)
  results = cars.map do |car|
    model_name = car['modeloNome']
    brand_name = car['marcaNome']
    price = car['preco']
    manufacturing_year = car['anoFabricacao']
    model_year = car['anoModelo']
    cover_photo = car['fotoCapa']

    local_path = "photos/#{brand_name}_#{model_name}.jpg"
    photo_url = "https://static2.meucarronovo.com.br/imagens-dinamicas/lista/fotos/#{cover_photo}"
    download_photo(photo_url, local_path)

    {
      "modelo": model_name,
      "marca": brand_name,
      "valor": price,
      "ano_fabricacao": manufacturing_year,
      "ano_modelo": model_year,
       "local_path": local_path
    }
  end

  results
end

def main
  url = 'https://www.meucarronovo.com.br/api/v2/busca?&tipoVeiculo=A&cidade=Francisco%20Beltrão'

  cars = fetch_cars(url)
  results = process_cars(cars)

  json_result = JSON.generate(results)
  puts json_result
end

main
