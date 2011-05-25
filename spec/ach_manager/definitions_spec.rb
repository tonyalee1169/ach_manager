require 'spec_helper'

describe Definitions do
  describe ".declare" do
    it "returns an instance of a FieldSet" do
      Definitions.declare do
        field 'name_here', 9, '1-10'
      end.should be_instance_of(FieldSet)
    end
  end
end
