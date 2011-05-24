require 'open-uri'

module ACHManager
  class Retriever
    ACH_LISTING = 'http://www.fededirectory.frb.org/FedACHdir.txt'
    def self.grab_current_list
      open(ACH_LISTING).split("\r\n")
    end
  end
end
