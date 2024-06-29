defmodule ConfidelyWeb.Router do
  use ConfidelyWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ConfidelyWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated, error_handler: ConfidelyWeb.AuthErrorHandler
  end

  pipeline :not_authenticated do
    plug Pow.Plug.RequireNotAuthenticated, error_handler: ConfidelyWeb.AuthErrorHandler
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through [:browser, :not_authenticated]

    get "/signup", ConfidelyWeb.RegistrationController, :new, as: :signup
    post "/signup", ConfidelyWeb.RegistrationController, :create
    get "/login", ConfidelyWeb.SessionController, :new, as: :login
    post "/login", ConfidelyWeb.SessionController, :create
  end

  scope "/" do
    pipe_through [:browser, :protected]

    delete "/logout", ConfidelyWeb.SessionController, :delete, as: :logout
  end

  scope "/", ConfidelyWeb do
    pipe_through [:browser, :protected]

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  # scope "/api", ConfidelyWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:confidely, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ConfidelyWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
