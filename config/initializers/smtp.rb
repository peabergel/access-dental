ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "gmail.com",
  user_name: ENV["GMAIL_USERNAME"], # Ton email Gmail
  password: ENV["GMAIL_PASSWORD"], # Ton mot de passe ou mot de passe d'application
  authentication: "plain",
  enable_starttls_auto: true
}
