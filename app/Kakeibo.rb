require 'sinatra'
require 'sqlite3'
require 'json'

db = SQLite3::Database.new 'kakeibo.db'
db.results_as_hash = true

before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

post '/post', provides: :json do
    params = request.body.read
    hash = Rack::Utils.parse_nested_query(params)
    date = hash["date"]
    category = hash["category"]
    item = hash["item"]
    price = hash["price"]
    discription = hash["discription"]
    res = db.execute("insert into list (date, category, item, price, discription) values ('#{date}', '#{category}', '#{item}', '#{price}', '#{discription}')")
    return 'Success and please push reload button'

end


get '/get_all' do
    i = 0
    body << "["
    db.execute("select * from list") do |row|
    body << (i==0 ? "" : ",") + row.to_json
    i += 1
    end
    body << "]"
end

delete '/delete' do
    id = params['id']
    p id
end
