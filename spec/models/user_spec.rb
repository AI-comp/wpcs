require 'spec_helper'

describe User do

  let(:user) { create(:alice) }

  it 'should have some fields' do
    expect(user.uid).not_to be_nil
    expect(user.name).not_to be_nil
    expect(user.email).not_to be_nil
    expect(user.encrypted_password).not_to be_nil
  end


end
