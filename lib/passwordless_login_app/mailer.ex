defmodule PasswordlessLoginApp.Mailer do
  alias PasswordlessLoginApp.{Endpoint, Router, User}
  use Mailgun.Client,
      domain: Application.get_env(:passwordless_login_app, :mailgun_domain),
      key: Application.get_env(:passwordless_login_app, :mailgun_key)

  def send_login_token(%User{email: email, access_token: token}) do
    send_email to: email,
    from: "noreply@example.com",
    subject: "Your token",
    text: "Access your account #{Router.Helpers.session_url(Endpoint, :show, token)}"
  end
end
