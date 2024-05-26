# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'  # Load the CSV library

file_path = "lib/assets/mvtf_data_sheet.csv"
csv_data = CSV.read(file_path, headers: false)
csv_data.each_with_index do |row, index|
  next if index == 0 || row[0].nil?

  # company name and slug
  name = row[0]&.strip

  #company details
  website = row[1]&.strip
  mobile_number = row[2]&.strip
  description = row[4]&.strip


  company =  Company.find_or_create_by(name: name)
  company_detail = CompanyDetail.find_or_create_by(company_id: company.id)
  company_detail.update!(company_id: company.id, description: description, website: website, mobile_number: mobile_number)
end
