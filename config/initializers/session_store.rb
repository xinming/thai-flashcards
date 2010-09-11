# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_thai_session',
  :secret      => '8306993aa19fec1ff8d4c30f27f6da95526f7f2ab8402d49cb771466a1eb33b10fd9389f2f9700c66df78df214d9d01fe0a5ffe6f6643de8b761dee3db6d34b0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
