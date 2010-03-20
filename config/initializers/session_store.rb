# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kadako_session',
  :secret      => 'b7a747fd0e14df00b5735bc12074e67b5834615bcdbbc45c39ba8a9b7bcbed8269fadbb241a9745e09e40b848ebf23afe1f2aec42ac3bf6cb0d69d1b1c3b3eaa'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
