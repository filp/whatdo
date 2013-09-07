# Be sure to restart your server when you modify this file.

# Generates a new secret token on first run and stores it in
# the application root as .secret_token for subsequent runs.
token_file = Rails.root.join(".secret_token")

unless File.exists?(token_file)
  File.open(token_file, "w") { |f| f.write(SecureRandom.hex(32)) }
end

Whatdo::Application.config.secret_key_base = File.read(token_file)