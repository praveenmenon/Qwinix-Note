require 'rails_helper'

RSpec.describe Note, :type => :model do


let(:note){FactoryGirl.create(:note)}

         context "Factory settings for notes" do
    	   it "should validate the note factories" do
      	   expect(FactoryGirl.build(:note).valid?).to be true
    	 end
 	   end

	describe Note do
		it{should validate_presence_of :title}
		it{should validate_presence_of :description}
	end

	it "should validate note length" do
		
		note.title = "xyz" * 50
		note.valid?
		expect(note.errors[:title].size).to be 1
		expect(note).to be_invalid

		note.title = "a"
		note.valid?
		expect(note.errors[:title].size).to be 1
		expect(note).to be_invalid

		note.title ="my first note"
		note.valid?
		expect(note.errors[:title].size).to be 0
		expect(note).to be_valid
	end

	it "should validate length of description" do

		note.description ="abcd" * 500
		note.valid?
		expect(note.errors[:description].size).to be 1
		expect(note).to be_invalid

		note.description ="a"
		note.valid?
		expect(note.errors[:description].size).to be 1
		expect(note).to be_invalid

		note.description ="this is my first note on ruby"
		note.valid?
		expect(note.errors[:description].size).to be 0
		expect(note).to be_valid

	end
end

