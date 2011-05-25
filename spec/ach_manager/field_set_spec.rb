require 'spec_helper'

describe FieldSet do
  let(:fieldset) {FieldSet.new}

  describe '#field' do
    it 'adds a new field to the list of fields in the set' do
      expect {
        fieldset.field('name_here', 1, '10')
      }.to change(fieldset.fields, :count).by(1)
    end

    it "converts the field's starting value to be zero-based" do
      Field.should_receive(:new).with(anything(), anything(), hash_including(:starts => 0))
      fieldset.field('name_here', 1, '1-10')
    end

    it "converts the range's ending value to be zero-based" do
      Field.should_receive(:new).with(anything(), anything(), hash_including(:stops => 9))
      fieldset.field('name_here', 1, '1-10')
    end

    context "when the field range is a single number" do
      it "supplies nil as an ending value for the range" do
        Field.should_receive(:new).with(anything(), anything(), hash_including(:stops => nil))
        fieldset.field('name_here', 1, '10')
      end
    end
  end
end
