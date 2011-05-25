require 'spec_helper'

describe Field do
  describe '#character_range' do
    context 'when no stop_position is supplied' do
      let(:field) {Field.new('field_name', 1, :starts => 1)}

      it 'returns a range with the same value for the starting and ending indices' do
        field.character_range.should == (1..1)
      end
    end

    context 'when a stop_position is supplied' do
      let(:field) {Field.new('field_name', 1, :starts => 0, :stops => 3)}

      it 'returns a range with the specified start & stop indices' do
        field.character_range.should == (0..3)
      end
    end

    context 'when a start position less than 0' do
      it 'raises an InvalidFieldError' do
        expect {
          Field.new('field_name', 1, :starts => -1, :stops => 3)
        }.should raise_error(InvalidFieldError)
      end
    end

    context 'when a stop position greater than 154' do
      it 'raises an InvalidFieldError' do
        expect {
          Field.new('field_name', 1, :starts => 0, :stops => 155)
        }.should raise_error(InvalidFieldError)
      end
    end
  end
end
