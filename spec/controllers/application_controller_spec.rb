require 'spec_helper'

describe ApplicationController do
  
  describe "#current_user" do
    
    it "should be a instance of User" do
      controller.current_user.should be_nil
    end
  end
  
  describe "#require_authentication" do

  end
end
