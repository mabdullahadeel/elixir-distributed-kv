defmodule DistributedKv.RegistryTest do
  use ExUnit.Case
  doctest DistributedKv.Registry
  alias DistributedKv.Registry, as: DistRegistry

  setup do
    registry = start_supervised!(DistributedKv.Registry)
    %{registry: registry}
  end

  test "spawns the buckets", %{registry: registry} do
    assert DistRegistry.lookup(registry, "animals") == :error

    DistRegistry.create(registry, "animals")
    assert {:ok, bucket} = DistributedKv.Registry.lookup(registry, "animals")

    DistributedKv.Bucket.put(bucket, "lion", 1)
    assert DistributedKv.Bucket.get(bucket, "lion") == 1
  end

  test "removes bucket on exit", %{registry: registry} do
    DistributedKv.Registry.create(registry, "animals")
    {:ok, bucket} = DistributedKv.Registry.lookup(registry, "animals")
    Agent.stop(bucket)
    assert DistributedKv.Registry.lookup(registry, "animals") == :error
  end
end
