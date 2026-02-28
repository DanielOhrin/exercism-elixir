defmodule Lasagna do
  @moduledoc """
  This module is useful for calculating the prep/cooking time for a Lasagna.

  """
  
  @expected_minutes_in_oven 40
  @minutes_per_layer 2
  @done_message "Ding!"
  
  @doc """
  This is the expected time(in minutes) that the lasagna should take to cook.
  """
  @spec expected_minutes_in_oven() :: integer()
  def expected_minutes_in_oven, do: @expected_minutes_in_oven

  @doc """
  Calculates the estimated remaining time left on the Lasagna (in minutes).

  ## Parameters
    minutes_cooked: The amount of minutes the Lasagna has been cooked so far.
  """
  @spec remaining_minutes_in_oven(minutes_cooked :: integer()) :: integer()
  def remaining_minutes_in_oven(minutes_cooked), do: @expected_minutes_in_oven - minutes_cooked

  @doc """
  Calculates the preparation time based on how many layers are in the Lasagna.

  ## Parameters
    layers: The amount of layers in the Lasagna.
  """
  @spec preparation_time_in_minutes(layers :: integer()) :: integer()
  def preparation_time_in_minutes(layers), do: @minutes_per_layer * layers

  @doc """
  Calculates the total time the Lasagna should take to make, from starting prep to coming out of the oven.

  ## Parameters
    layers: The amount of layers in the Lasagna.
    minutes_cooked: The amount of minutes the Lasagna has already been cooking
  """  
  @spec total_time_in_minutes(layers :: integer(), minutes_cooked :: integer()) :: integer()
  def total_time_in_minutes(layers, minutes_cooked) do
    prep = layers |> 
      preparation_time_in_minutes()

    prep + minutes_cooked
  end

  @doc """
  Returns a message indicating that the Lasagna is ready to eat.
  """
  @spec alarm() :: String.t()
  def alarm, do: @done_message
end
