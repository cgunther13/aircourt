json.extract! court, :id, :renter_id, :court_type, :directions, :court_rules, :location, :photo, :max_guests, :created_at, :updated_at
json.url court_url(court, format: :json)
