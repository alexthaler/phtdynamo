defmodule PhtDynamo do
  use Application.Behaviour

  @doc """
  The application callback used to start this
  application and its Dynamos.
  """
  def start(_type, _args) do
    PhtDynamo.Sup.start_link
  end
end

defmodule PhtDynamo.Sup do
  use Supervisor.Behaviour

  def start_link do
    :supervisor.start_link({ :local, __MODULE__ }, __MODULE__, [])
  end

  def init([]) do
    tree = [worker(PhtDynamo.Dynamo, []), worker(Pht.Repo, [])]
    supervise(tree, strategy: :one_for_all)
  end
end
