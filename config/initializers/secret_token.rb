
# Definitely change this when you deploy to production. Ours is replaced by jenkins.
# This token is used to secure sessions, we don't mind shipping with one to ease test and debug,
#  however, the stock one should never be used in production, people will be able to crack
#  session cookies.
#
# Generate a new secret with "rake secret".  Copy the output of that command and paste it
# in your secret_token.rb as the value of Discourse::Application.config.secret_token:
#
ENV['SECRET_TOKEN'] = "6c18efd39d9db89f3e380261c03fe6b76b46e4365b1d94aeaf6a368465ea4981fd60b4110bb85581617d436b74046b0cd8c3b49c999eb868044840aa4fcf3e45"

# delete all lines below in production
if Rails.env.test? || Rails.env.development? || Rails.env == "profile"
  Discourse::Application.config.secret_token = "47f5390004bf6d25bb97083fb98e7cc133ab450ba814dd19638a78282b4ca291"
else
  raise "You must set a secret token in ENV['SECRET_TOKEN'] or in config/initializers/secret_token.rb" if ENV['SECRET_TOKEN'].blank?
  Discourse::Application.config.secret_token = ENV['SECRET_TOKEN']
end

