class CrosswordHelper

	def initialize(wordlist_file)
		raise ArgumentError, "Wordlist file could not be found" unless File.exists?(wordlist_file)
		@wordlist_file = wordlist_file
	end

	# Takes a word with question marks for unknown letters, and returns a list of words that match
	def search(word)
		raise ArgumentError, "Word can only contain alphabetic characters and question marks" unless word =~ /^[A-Z\?]+$/i

		word = word.gsub('?', '.')
		regex = Regexp.new("^#{word}$", true)

		words = []
		File.open(@wordlist_file).each_line do |line|
			words << line.strip if line =~ regex
		end

		return words
	end
	
end
