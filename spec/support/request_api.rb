module RequestAPI
  def body_json(symbolize_keys: false)
    json = JSON.parse(response.body)
    # abaixo faço um f ternario, que se  o symbolize_keys for true retornamos ele simbolizado ex: { :user_name "jose"}
    # caso seja false devolvemos um json
    symbolize_keys ? json.deep_symbolize_keys : json
    # caso de algum erro vou retornanr vazio com o rescue
  rescue
    return {}
  end

  def auth_header(user = nil, merge_with: {})
    #abaixo o user ou vai ser passado por parâmetro, caso não seja vamos criar um user
    user ||= create(:user)
    auth = user.create_new_auth_token
    header = auth.merge({ 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
    header.merge merge_with
  end
end

RSpec.configure do |config|
  config.include RequestAPI, type: :request
end