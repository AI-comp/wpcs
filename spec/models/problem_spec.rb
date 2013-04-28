require 'spec_helper'

describe Problem do

  let(:addition) { build(:addition) }

  describe 'after save' do

    after do
      addition.destroy
    end

    it 'should have description_html' do
      addition.save!
      expect(addition.description_html).not_to be_nil
    end

  end

end
