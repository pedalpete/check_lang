require 'iconv'

utf8 = File.open("test_files/td.txt").read
new_file = File.open("test_files/test_d1.txt","w")
new_utf8=utf8.gsub(/\r\n/," ").gsub(/[^a-z]/, ' ')
p new_utf8
new_file.write(new_utf8)
new_file.close
