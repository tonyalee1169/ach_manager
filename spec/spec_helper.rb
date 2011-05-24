require 'ach_manager'
include ACHManager

def stub_retrieval
  Retriever.stub!(:open).with(Retriever::ACH_LISTING).and_return(File.read(fixture_file))
end

def fixture_file
  File.expand_path('spec/fixtures/ach_listing.txt')
end
