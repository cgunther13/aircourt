json.extract! renter, :id, :email, :password, :username, :first_name, :last_name, :created_at, :updated_at
json.url renter_url(renter, format: :json)
