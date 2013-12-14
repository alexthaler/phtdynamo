defmodule Pht.Game do
    use Ecto.Model

    queryable "game" do
        field :game_name,   :string
        field :num_drinks,  :integer
        field :start_time,  :string
        field :end_time,    :string
    end
end