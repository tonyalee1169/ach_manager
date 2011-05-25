module ACHManager
  module Definitions
    extend self

    def declare(&block)
      fieldset = FieldSet.new
      fieldset.instance_eval(&block)
      fieldset
    end
  end
end
