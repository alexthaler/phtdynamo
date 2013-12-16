defmodule Pht.Game do
    use Ecto.Model

    queryable "game" do
        field :game_name,   :string
        field :num_drinks,  :integer,   default: 60
        field :start_time,  :string
        field :end_time,    :string
        field :completed,   :boolean,   default: false
        field :active,      :boolean,   default: true
    end

    def to_json(game) do
        JSON.encode(
            ["game_name": game.game_name,
             "num_drinks": game.num_drinks,
             "start_time": game.start_time,
             "end_time": game.end_time,
             "completed": game.completed,
             "active": game.active
            ]
        )
    end
end