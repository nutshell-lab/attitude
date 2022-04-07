defmodule AttitudeTest do
  use ExUnit.Case

  test "Can match an implemented Trackable with a list of attitudes" do
    defimpl Attitude.Trackable, for: BitString do
      def track_attitudes(string) do
        Enum.scan(
          [
            fn str -> if String.length(str) < 10, do: :less_than_10_chars end,
            fn str -> if String.contains?(str, "bbq"), do: :contains_bbq end
          ],
          [],
          fn tracker, _ -> tracker.(string) end
        )
      end
    end

    assert "brief bbq"
           |> Attitude.attitudes()
           |> Attitude.match?([:less_than_10_chars, :contains_bbq])
  end
end
