require_relative '../language'

describe Language do
	
	before :each do
		@language = Language.new "test_files/test.txt"
	end

	describe "#new" do
		it "gets a local file" do
			@language.should be_an_instance_of Language
		end

		it "get a file" do
			language = Language.new "test_files/test.txt"
			language.should be_an_instance_of Language
		end

		it "returns if file is not found" do
			language = Language.new "../non-existent-file.txt"
			language.should be_an_instance_of Language
		end
	end

	describe "#clean_text" do
		it "returns a cleaned text array" do
			@language.clean_text.should eql "esto es ahora un monton de texto frances es mejor que ingles".split
		end
	end

	describe "compares to language" do
		it "gets a dictionary" do
			@language.get_dictionary('samples/francais.1')[5].should be == 'dibilit'
		end

		it "finds how many words match in the dictionary" do
			@language.compare_dict('samples/francais.1').should be == 4
		end
	end

	describe "gets each language" do
		it "gets each language and compares them to the input" do
			@language.get_comparisons.length.should be == 4
		end
	end

	describe "get best match" do
		it "returns the highest matching language" do
			@language.best_match.should be == "francais"
		end
	end
end