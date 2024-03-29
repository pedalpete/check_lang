def start
  p "Enter a file name to get language from:"
  lang = gets.gsub(/[^0-9a-zA-Z.\/\\-_\~]/,"") #clean input before sending to lang
  p lang
  file = Language.new lang
  if file.check_file.nil?  #if the file wasn't found, ask for another, and give some feedback
  	p "could not find specified file."
  	p "enter a relative path to the file"
  	p "valid file & path characters are"
  	p "numbers, letters, .\\/-_~"
  	start
  else
  	lang_match = file.best_match  #find which language this is
  	p "---------------------------------------"
  	p "the input file was in "+lang_match.upcase
  end
end