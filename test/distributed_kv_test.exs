defmodule DistributedKvTest do
  use ExUnit.Case
  doctest DistributedKv

  test "greets the user" do
    assert DistributedKv.hello() == "hello there!"
  end

  test "greet the user with name" do
    assert DistributedKv.hello("John") == "hello John"
  end
end
