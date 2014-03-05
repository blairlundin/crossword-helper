require 'crossword_helper'
require 'securerandom'


describe CrosswordHelper do

	describe '#initialize' do
	    it 'raises an ArgumentError if the wordlist file does not exist' do
	    	expect{ CrosswordHelper.new(SecureRandom.hex) }.to raise_error(ArgumentError)
	    end
	end

	describe '#search' do
		let(:ch) { CrosswordHelper.new('wordlist.txt') }

	    it 'raises an ArgumentError if the word contains special characters' do
	    	expect{ ch.search('#') }.to raise_error(ArgumentError)
	    end

	    it 'raises an ArgumentError if multiple words were specified' do
	    	expect{ ch.search('one two') }.to raise_error(ArgumentError)
	    end

	    it 'does not raise an ArgumentError if the word is valid' do
	    	expect{ ch.search('r?by') }.not_to raise_error
	    end

	    it 'returns the correct result for a given word' do
	    	expect( ch.search('r?by') ).to include('ruby')
	    end

	    it 'matches words case-insensitively' do
	    	expect( ch.search('R?BY') ).to include('ruby')
	    end
	end
	
end