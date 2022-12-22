defmodule DistributedKv.BucketTest do
  use ExUnit.Case, async: true
  alias DistributedKv.Bucket

  setup do
    {:ok, bucket} = Bucket.start_link([])
    {:ok, bucket: bucket}
  end

  test "stores and retrieve value by key", %{bucket: bucket} do
    assert Bucket.get(bucket, "foo") == nil

    Bucket.put(bucket, "foo", "bar")
    assert Bucket.get(bucket, "foo") == "bar"
  end

  test "delete value from the bucket", %{bucket: bucket} do
    Bucket.put(bucket, "milk", "milche")

    assert Bucket.get(bucket, "milk") == "milche"
    deleted = Bucket.delete(bucket, "milk")
    assert Bucket.get(bucket, deleted) == nil
  end
end
