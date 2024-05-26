company_names = [
  {name: 'Vaidam Health', slug: 'vaidam_health', company_details: {website: 'https://www.vaidam.com/', mobile_number: '099716 16131'}},
  {name: 'Apollo Hospitals', slug: 'apollo_hospital', company_details: {website: 'https://www.apollohospitals.com/', mobile_number: '099716 16131'}},
  {name: 'Med Monks', slug: 'med_monks', company_details: {website: 'https://medmonks.com/', mobile_number: '099716 16131'}},
  {name: 'Credi Health', slug: 'credi_health',company_details: {website: 'https://www.credihealth.com/', mobile_number: '080109 94994'}},
  {name: 'Max life', slug: 'max_life',company_details: {website: 'https://maxlifeind.com/', mobile_number: '080109 94994'}}
]

company_names.each do |hash|
  company_details = hash[:company_details]
  company = Company.create(name: hash[:name], slug: hash[:slug])
  CompanyDetail.create(website: company_details[:website], mobile_number: company_details[:mobile_number], company_id: company.id)
end