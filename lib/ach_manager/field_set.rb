module ACHManager
  class FieldSet
    attr_reader :fields
    def initialize
      @fields = []
    end

    def field(name, length, position)
      start_position, stop_position = position.split("-")
      start_position = start_position.to_i - 1
      stop_position = stop_position.nil? ? nil : stop_position.to_i - 1

      new_field = Field.new(name, length, {:starts => start_position, :stops => stop_position})
      @fields << new_field
      new_field
    end
  end
end
