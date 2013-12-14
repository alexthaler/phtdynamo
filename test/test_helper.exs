Dynamo.under_test(PhtDynamo.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule PhtDynamo.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
