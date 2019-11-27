require 'pg'

list_insert = []

def is_null(value)
  if(value == 'null')
    0
  else
    value
  end
end

File.open("courses_prod_cuatro.txt").each_with_index do |line, index|
  row = line.gsub("\r\n", "").split(",")
    list_insert << "INSERT INTO courses VALUES ('#{row[0]}', '#{row[1]}', '#{row[2]}', '#{row[3]}', '#{row[4]}', '#{row[5]}', '#{row[6]}', '#{row[7]}', '#{row[8]}', '#{row[9]}', '#{row[10]}', '#{row[11]}', '#{row[12]}', '#{row[13]}', '#{row[14]}','#{row[15]}', '#{is_null(row[16])}', '#{row[17]}', '#{row[18]}', '#{row[19]}', '#{row[20]}', '#{row[21]}', '#{row[22]}', '#{row[23]}', '#{row[24]}', '#{row[25]}', '#{row[26]}', '#{row[27]}', '#{row[28]}', '#{row[29]}', '#{row[30]}', '#{row[31]}', '#{row[32]}', '#{row[33]}', '#{row[34]}', '#{row[35]}', '#{row[36]}', '#{row[37]}', '#{row[38]}', '#{row[39]}');"
end



#list_insert.each { |e| p e}

f = File.new('out.sql', 'a')
list_insert.each { |e| f.write("#{e}\n") }
f.close


puts "Comienza insert"
begin

    con = PG.connect :dbname => 'faltas_suplencias_dev', :user => 'postgres',
        :password => 'postgres'

    user = con.user
    db_name = con.db
    pswd = con.pass
    list_insert.each { |e| con.exec(e) }
    puts "User: #{user}"
    puts "Database name: #{db_name}"
    puts "Password: #{pswd}"

rescue PG::Error => e

    puts e.message

ensure

    con.close if con

end