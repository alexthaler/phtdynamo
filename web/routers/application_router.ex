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

  get "/game/:game_id" do
    {gameid, _} = Integer.parse(conn.params[:game_id])
    game = Pht.Repo.get Pht.Game, gameid
    {_, game_json} = Pht.Game.to_json(game)

    conn = conn.put_resp_header "Content-Type", "application/json"
    conn.put_private :result_object, game_json
  end

  post "/game" do
    conn = conn.fetch(:body)

    post_data = JSON.decode!(conn.req_body)
    user_game_name = post_data["game_name"]
    user_num_drinks = post_data["num_drinks"]

    start_time = Date.from(Date.universal())
    end_time = Date.shift(start_time, min: user_num_drinks)

    game = Pht.Game.new(game_name: user_game_name)
    game = game.start_time(DateFmt.format!(start_time, "{ISO}"))
    game = game.end_time(DateFmt.format!(end_time, "{ISO}"))
    game = game.num_drinks(user_num_drinks)
    game = Pht.Repo.create(game)

    {_, game_json} = Pht.Game.to_json(game)

    # game = Pht.Game.new(game_name: conn.params[:game_name])
    conn = conn.put_resp_header "Content-Type", "application/json"
    conn.put_private :result_object, game_json
  end

  post "/game/:game_id/complete" do
    {gameid, _} = Integer.parse(conn.params[:game_id])
    game = Pht.Repo.get Pht.Game, gameid
    game = game.completed(true)

    Pht.Repo.update(game)
    {_, game_json} = Pht.Game.to_json(game)

    # game = Pht.Game.new(game_name: conn.params[:game_name])
    conn = conn.put_resp_header "Content-Type", "application/json"
    conn.put_private :result_object, game_json
  end
end
