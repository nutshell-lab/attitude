defmodule AttitudesTest do
  use ExUnit.Case
  doctest Attitudes

  test "greets the world" do
    assert Attitudes.hello() == :world
  end
end
