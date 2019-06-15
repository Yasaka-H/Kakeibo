require 'sinatra'
require 'sqlite3'
require 'json'

db = SQLite3::Database.new 'kakeibo.db'
db.results_as_hash = true

before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

post '/post' do
    # params = JSON.parse request.body.read
    # date = params[:date]
    # insertStat = 'insert into list (date, category, item, price, discription) values ( ' + data.to_s + ', "meal", "okashi", 200, "test")'
    res = db.execute('insert into list (date, category, item, price, discription) values ("2019-06-14", "食費", "okashi", 200, "test")')
    
    # p res
    # db.execute(insertStat)
    return 'hello'
    
end


get '/get_all' do
    i = 0
    body << "["
    db.execute("select * from list") do |row|
    # body << row.to_json
        #(i == 0) ? '' : ',' 
    # p row
    body << (i==0 ? "" : ",") + row.to_json
    i += 1
    end
    body << "]"
    # body
end

