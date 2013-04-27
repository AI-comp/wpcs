require 'spec_helper'

describe Admin::ContestsController do

  include_examples 'respond success', :index
  include_examples 'respond success', :new

end
