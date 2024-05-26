class CreateEnquiryForms < ActiveRecord::Migration[7.1]
  def change
    create_table :enquiry_forms do |t|
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
