defmodule PhtDynamo.Dynamo do
  use Dynamo

  config :dynamo,
    # The environment this Dynamo runs on
    env: Mix.env,

    # The OTP application associated with this Dynamo
    otp_app: :pht_dynamo,

    # The endpoint to dispatch requests to
    endpoint: ApplicationRouter,

    # The route from which static assets are served
    # You can turn off static assets by setting it to false
    static_route: "/"

  # Uncomment the lines below to enable the cookie session store
    config :dynamo,
      session_store: Session.CookieStore,
      session_options:
        [ key: "_pht_dynamo_session",
          secret: "xauf8/AKinnnBwYrO+GRhdFh5isqBF9Q2x6w0uDuMj925ZLU+nTea7VBMc5L3bTO"]

  # Default functionality available in templates
  templates do
    use Dynamo.Helpers
  end
end
