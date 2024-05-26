class CompanyDetail < ApplicationRecord

  # ASSOCIATIONS
  belongs_to :company, inverse_of: :company_details

  def self.top_company_details
    CompanyDetail.includes(:company).all.order(:popularity)
  end

end
