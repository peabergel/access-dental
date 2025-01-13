ActionMailer::Base.smtp_settings = {
  address: "smtp-relay.brevo.com",
  port: "587",
  domain: "scalingo.com",
  user_name: ENV["BREVO_API_TOKEN"],
  password: ENV["BREVO_API_TOKEN"],
  # authentification: (ici le wagon met :cram_md5)
  authentication:  "plain",
  enable_starttls_auto: true
}
