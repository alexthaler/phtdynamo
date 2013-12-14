defmodule Pht.Game do
    use Ecto.Model

    queryable "game" do
        field :game_name,   :string
        field :num_drinks,  :integer
        field :start_time,  :string
        field :end_time,    :string
    end

    def to_json(game) do
        JSON.encode(["game":
            ["game_name": game.game_name,
             "num_drinks": game.num_drinks,
             "start_time": game.start_time,
             "end_time": game.end_time
            ]
        ])
    end
end