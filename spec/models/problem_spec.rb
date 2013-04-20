require 'spec_helper'

describe Problem do

  before do
    @problem = Problem.new(
      title: 'addition',
      description: 'a+b=?',
      small_input: '1 1',
      small_output: '2',
      large_input: '100 100',
      large_output: '200',
      small_score: 3,
      large_score: 1020
    )
  end

  describe 'when created' do

    it 'should not have description_html' do
      expect(@problem.description_html).to be_nil
    end

  end

  describe 'after save' do

    it 'should have description_html' do
      @problem.save!
      expect(@problem.description_html).not_to be_nil
    end

  end

end
