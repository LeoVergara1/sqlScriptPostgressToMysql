list_insert = []
def is_null(value){
  if(value == 'null'){
    0
  }
  else{
    value
  }
}

def check_comma(value){
  return value.replace("\"", "").replace(",", "\\,")
}

new File("courses_prod_comma_1.txt").eachLine { line -> 
        def row = line.split(";")
        list_insert << "INSERT INTO courses VALUES ('${row[0]}', '${row[1]}', '${row[2]}', '${row[3]}', '${check_comma(row[4])}', '${check_comma(row[5])}', '${check_comma(row[6])}', '${check_comma(row[7])}', '${check_comma(row[8])}', '${check_comma(row[9])}', '${row[10]}', '${row[11]}', '${row[12]}', '${row[13]}', '${row[14]}','${row[15]}', '${is_null(row[16])}', '${check_comma(row[17])}', '${check_comma(row[18])}', '${check_comma(row[19])}', '${check_comma(row[20])}', '${check_comma(row[21])}', '${check_comma(row[22])}', '${check_comma(row[23])}', '${check_comma(row[24])}', '${check_comma(row[25])}', '${check_comma(row[26])}', '${check_comma(row[27])}', '${check_comma(row[28])}', '${check_comma(row[29])}', '${check_comma(row[30])}', '${check_comma(row[31])}', '${check_comma(row[32])}', '${check_comma(row[33])}', '${row[34]}', '${check_comma(row[35])}', '${check_comma(row[36])}', '${check_comma(row[37])}', '${check_comma(row[38])}', '${check_comma(row[39])}');"
     }

def file = new File('Example.sql')


list_insert.each{
  file.append("${it}\n")
}
