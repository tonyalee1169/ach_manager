require 'spec_helper'

describe Retriever do
  before(:each) do
    stub_retrieval
  end

  describe ".grab_current_list" do
    it "retrieves the current ACH institution file from the FRB site" do
      Retriever.should_receive(:open).with(Retriever::ACH_LISTING)
      Retriever.grab_current_list
    end

    it "returns a list of strings, each with 155 characters" do
      Retriever.grab_current_list.first.length.should == 155
    end

    it "returns a list of two elements (when using a fixture file)" do
      Retriever.grab_current_list.should have(2).items
    end
  end
end
