defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    # Pick which parts of the request you want to fetch
    # You can comment the line below if you don't need
    # any of them or move them to a forwarded router
    conn.fetch([:cookies, :params])
  end

  filter Dynamo.Filters.Static.new("/public", "priv/static")

  # It is common to break your Dynamo into many
  # routers, forwarding the requests between them:
  # forward "/posts", to: PostsRouter
  get "/" do
    conn = conn.assign(:title, "Welcome to Dynamo!")
    redirect conn, to: "/static/foo.html", format: :html
  end
end
