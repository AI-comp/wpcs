require 'spec_helper'

describe Contest do

  let(:contest) { build(:wupc) }

  it 'should have problems' do
    expect(contest.problems).not_to be_nil
    expect(contest).to have(1).problems
  end

end
