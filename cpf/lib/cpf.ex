defmodule Cpf do
  @moduledoc """
  Documentation for `Cpf`.
  """

  @doc """
  Starts the CPF menu.
  """
  def start do
    IO.write("[c]heck CPF or [g]enerate CPF: ")
    user_choice = IO.gets("") |> String.trim() |> String.downcase()

    case user_choice do
      "c" -> CpfChecker.check()
      "g" ->
        cpf = CpfGenerator.generate()
        IO.puts("#{cpf}")
      _ -> IO.puts("Invalid option!")
    end
  end

  @doc """
  Entry point for the escript.
  """
  def main(_args) do
    start()
  end
end
