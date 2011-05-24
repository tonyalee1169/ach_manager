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

    context "when the environment variable LOCAL is set to true" do
      let(:fake_file) {double('FakeFile', :to_path => fixture_file)}

      before(:each) do
        ENV['LOCAL'] = 'true'
      end

      it "should not make a remote request" do
        Retriever.should_not_receive(:open).with(Retriever::ACH_LISTING)
        Retriever.grab_current_list
      end

      it "should open the fixture file" do
        File.should_receive(:open).with(fixture_file).and_return(fake_file)
        Retriever.grab_current_list
      end
    end
  end
end
