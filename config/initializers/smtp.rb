ActionMailer::Base.smtp_settings = {
  address: "mail.access-dental.com",
  port: 465,
  domain: "access-dental.com",
  user_name: ENV["O2SWITCH_USERNAME"], # Ton email Gmail
  password: ENV["O2SWITCH_PASSWORD"], # Ton mot de passe ou mot de passe d'application
  authentication: "plain",
  enable_starttls_auto: true
}
