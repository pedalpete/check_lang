# encoding: UTF-8

class Language
	def initialize filename
		return unless File.exist?(filename)
		@file = File.open(filename, "r").read.downcase.gsub(/[^a-z\s]/,"").split 
		@comparison = {}
	end

	def check_file
		return @file
	end

	def clean_text
		cleaned =  @file#.downcase.gsub(/[^a-z\s]/,"").split
		return cleaned
	end

	def get_dictionary lang
		dictionary = File.open(lang).read.split
		return dictionary 
	end

	def compare_dict lang
		dict = get_dictionary lang
		p 'checking '+lang
		intersection = clean_text & dict
		return intersection.length
	end

	def get_comparisons
		Dir.glob("samples/*") do |lang|
			language_name = lang.gsub('samples/','').gsub(/[^a-zA-Z]/,'')
			if !@comparison.has_key?(language_name)
				@comparison[language_name]=compare_dict(lang)
			else
				@comparison[language_name] += compare_dict(lang)
			end
		end

		return @comparison.sort_by{|k,v| v}.reverse #returning the sorted hash
	end

	def best_match
		best = get_comparisons
		if best.first[1]==0
			return "unknown language"
		else
			return best.first.first
		end
	end
end