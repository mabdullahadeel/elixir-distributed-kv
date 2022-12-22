defmodule DistributedKv do
  @moduledoc """
  Documentation for `DistributedKv`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> DistributedKv.hello()
      "hello there!"

  """

  @spec hello(String.t()) :: String.t()
  def hello(name) when is_binary(name) do
    "hello " <> name
  end

  @spec hello :: String.t()
  def hello, do: "hello there!"
end
