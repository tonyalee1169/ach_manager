class CreateInstitutions < ActiveRecord::Migration
  def self.up
    create_table :institutions do |t|
      t.string 'routing_number', 'office_code', 'servicing_frb_number', 'record_type_code'
      t.string 'change_date', 'new_routing_number', 'customer_name', 'address', 'city', 'state_code'
      t.string 'zipcode', 'zipcode_extension', 'telephone_area_code', 'telephone_prefix_number'
      t.string 'telephone_suffix_number', 'institution_status_code', 'data_view_code', 'filler'
    end
  end

  def self.down
    drop_table :institutions
  end
end
