defmodule Pht.Repo.Migrations.PhtCreate do
  use Ecto.Migration

  def up do
    "CREATE TABLE game(
        id serial primary key,
        game_name varchar(200),
        start_time varchar(30),
        end_time varchar(30),
        num_drinks integer,
        completed boolean,
        active boolean
        )"
  end

  def down do
    "DROP TABLE game"
  end
end
