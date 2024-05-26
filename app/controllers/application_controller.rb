class ApplicationController < ActionController::Base
  def home
    @company_details =  CompanyDetail.top_company_details
    @total_listed_companes = @company_details.count
  end

  def create_enquiry
    email =  params[:enquiry_form][:email]
    phone_number =  params[:enquiry_form][:phone_number]

    EnquiryForm.create(email: email, phone_number: phone_number)

    redirect_to "/home", notice: "Your enquiry sent successfully."
  end
end
