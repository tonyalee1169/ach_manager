require 'spec_helper'

describe Parser do
  let(:definitions) {
    Definitions.declare do
      field 'routing_number', 9, '1-9'
      field 'office_code', 1, '10'
    end
  }
  let(:routing_number) {'ninechars'}
  let(:office_code) {'O'}
  let(:full_string) {routing_number + office_code}
  let(:parser) {Parser.new(definitions)}

  describe "#parse" do
    it "returns a Hash with the field names as keys and the parsing result as the values" do
      parser.parse(full_string).should include({:routing_number => routing_number})
      parser.parse(full_string).should include({:office_code=> office_code})
    end

    context "when the string retrieved has whitespace on the ends" do
      let(:routing_number) {'  34567  '}

      it "strips leading and trailing whitespace" do
        parser.parse(full_string).should include({:routing_number => '34567'})
      end
    end
  end
end
