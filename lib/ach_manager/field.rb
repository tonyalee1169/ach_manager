module ACHManager
  class Field
    MIN_START = 0
    MAX_END = 154
    attr_reader :name

    def initialize(name, length, positions = {})
      @name = name
      @length = length.to_i
      @start_position = positions[:starts]
      @stop_position = positions[:stops] || @start_position

      validate_starting_position
      validate_ending_position
    end

    def character_range
      Range.new(@start_position, @stop_position)
    end

    private
      def validate_starting_position
        if @start_position < MIN_START
          raise InvalidFieldError, "Field start position must be greater than #{MIN_START}"
        end
      end

      def validate_ending_position
        if @stop_position > MAX_END
          raise InvalidFieldError, "Field stop position must be less than #{MAX_END}"
        end
      end
  end
end
