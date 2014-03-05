#!/usr/bin/env ruby

require_relative 'lib/crossword_helper'

ch = CrosswordHelper.new('wordlist.txt')


loop do
	puts "\nEnter a word, using '?' for letters you don't know (e.g. 'r?by')"
	puts "Type 'exit' to quit"
	print ": "
	input = gets.strip

	break if input.casecmp('exit') == 0

	begin
		matches = ch.search(input)
	rescue => ex
		puts "Error: #{ex.message}"
		next
	end

	if matches.empty? then
		puts "No matching words found for '#{input}'"
	else
		puts "Matching words for '#{input}':"
		puts matches.join("\n")
	end
end