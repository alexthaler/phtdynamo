defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    # Pick which parts of the request you want to fetch
    # You can comment the line below if you don't need
    # any of them or move them to a forwarded router
    conn.fetch([:cookies, :params])
  end

  filter Dynamo.Filters.Static.new("/public", "priv/static")
  filter JSON.Dynamo.Filter

  # It is common to break your Dynamo into many
  # routers, forwarding the requests between them:
  # forward "/posts", to: PostsRouter

  get "/" do
    conn = conn.put_resp_header "Content-Type", "text/html"
    conn.sendfile 200, "public/index.html"
  end

  get "/datastore" do
    conn = conn.put_resp_header "Content-Type", "application/json"
    conn.put_private :result_object, [data: "value", foo: "bar"]
  end
end
