require 'open-uri'

module ACHManager
  class Retriever
    ACH_LISTING = 'http://www.fededirectory.frb.org/FedACHdir.txt'
    FIXTURE_FILE = File.expand_path(File.dirname(__FILE__) + '/../../spec/fixtures/ach_listing.txt')

    def self.grab_current_list
      File.read(content).split("\r\n")
    end

    private
      def self.content
        ENV['LOCAL'] == 'true' ? File.open(FIXTURE_FILE) : open(ACH_LISTING)
      end
  end
end
