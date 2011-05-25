module ACHManager
  class Parser
    def initialize(fieldset)
      @fieldset = fieldset
    end

    def parse(string)
      @fieldset.fields.inject({}) {|all, current_field|
        all.merge(current_field.name.to_sym => string[current_field.character_range])
      }
    end
  end
end
