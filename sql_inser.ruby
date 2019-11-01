list_insert = []
File.open("inserts.txt").each_with_index do |line, index|
  row = line.gsub("\r\n", "").split(",")
    list_insert << {
      id: index + 1,
      pidm: row[0],
      username: row[1],
      recr_code: row[2],
      
    }
end

list_insert.each { |e| p e}