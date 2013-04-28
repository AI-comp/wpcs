require 'spec_helper'

describe 'database cleaner' do

  it 'should reseed' do
    expect(Group.default).not_to be_nil
  end

end
