defmodule Portal do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(Portal.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Portal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defstruct [:left, :right]

  @doc """
  Starts transfering `data` from `left` to `right`.
  """
  def transfer(left, right, data) do
    # First add all data to the portal on the left
    for item <- data do
       Portal.Door.push(left, item)
    end

    # Returns a portal struct we will use next
    %Portal{left: left, right: right}
  end

  @doc """
  Pushes data to the right in the given `portal`.
  """
  def push_right(portal) do
    case Portal.Door.pop(portal.left) do
      :error   -> :ok
      {:ok, h} -> Portal.Door.push(portal.right, h)
    end

    #Let's return the portal itself
    portal
  end
end

defimpl Inspect, for: Portal do
  def inspect(%Portal{left: left, right: right}, _) do
    #Using inspect, get the text representation of the doors and the data inside of them
    left_door = inspect(left)
    right_door = inspect(right
    left_data = inspect(Enum.reverse(Portal.Door.get(left)))
    right_data = inspect(Portal.Door.get(right))

    # Figures out the max length of left door or left data to alignt the output properly
    max = max(String.length(left_door), String.length(left_data))

    #Return a string of the data we want represented the way we want to represent it
    """
    #Portal<
      #{String.rjust(left_door, max)} <=> #{right_door}
      #{String.rjust(left_data, max)} <=> #{right_data}
    >
    """
  end
end
