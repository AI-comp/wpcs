require 'spec_helper'

describe Problem do

  let(:problem) { build(:problem) }

  describe 'after save' do

    after do
      problem.destroy
    end

    it 'should have description_html' do
      problem.save!
      expect(problem.description_html).not_to be_nil
    end

  end

end
