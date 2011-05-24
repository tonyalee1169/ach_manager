require 'ach_manager'
include ACHManager

def stub_retrieval
  Retriever.stub!(:open).with(Retriever::ACH_LISTING).and_return(@file_handle)
end

def fixture_file
  File.expand_path('spec/fixtures/ach_listing.txt')
end

RSpec.configure do |config|
  config.before(:each) do
    @file_handle = File.open(fixture_file, 'r')
  end

  config.after(:each) do
    @file_handle.close
  end
end
