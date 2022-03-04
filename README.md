# Attitude
Attitude is a small framework letting you track how your data behave.

```elixir
if Attitude.match?(user, [:updated_address, :live_in_france, :has_bought_at_lest_once]) do
  UserNotifier.deliver_welcome_france_discount()
end
```

## Installation

```elixir
def deps do
  [
    {:attitude, "https://github.com/nutshell-lab/attitude.git"}
  ]
end
```


