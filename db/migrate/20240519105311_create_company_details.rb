class CreateCompanyDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :company_details do |t|
      t.string :website
      t.string :mobile_number
      t.string :address
      t.string :popularity
      t.string :description
      t.references :company, foreign_key: true, null: false

      t.timestamps
    end
  end
end
