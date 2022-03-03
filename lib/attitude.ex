defprotocol Attitude.Trackable do
  @moduledoc """
  Trackable protocol used by `Attitude` module.

  When you invoke a function in the `Attitude` module, the first argument
  implement the Trackable protocol. This means a specific implementation
  has been provided to produce specific attitudes for this type of data.

  As this is a business concern, there is no default implemention of this
  protocol. You are expected to consider it as a framework for your own
  implementations.
  """
  @type t :: t()

  @doc """
  Produces a list of attitudes from the given parameter.
  """
  @spec track_attitudes(t()) :: [atom()]
  def track_attitudes(data)
end

defmodule Attitude do
  @moduledoc """
  Provides a set a function to produce information about trackable entities.
  """
  alias Attitude.Trackable

  @spec attitudes(Trackable.t()) :: [atom()]
  def attitudes(trackable) do
    Trackable.track_attitudes(trackable)
  end

  @doc """
  Determines whether a trackable behave with the expected attitudes.

  ## Example

    iex> if Attitude.match?(user, [:updated_home_address, :live_in_france, :has_bought_at_least_once]), do: UserNotifier.deliver_welcome_in_france_discount(user)
    :sent
  """
  def match?(trackable, expected_attitudes) do
    observed_attitudes = Trackable.track_attitudes(trackable)
    matching_attitudes = Enum.filter(expected_attitudes, &Enum.member?(observed_attitudes, &1))

    matching_attitudes == expected_attitudes
  end
end
