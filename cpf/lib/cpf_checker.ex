defmodule CpfChecker do
  def check do
    # Getting the CPF to be verified through user input
    IO.write("Insert the CPF to be verified: ")
    user_input = IO.gets("") |> String.trim()

    # Removing all non-digit characters
    cleaned_user_input = user_input |> String.replace(~r/\D/, "")

    # Validating the inserted CPF
    if valid_cpf?(cleaned_user_input) do
      cpf_int_array =
        cleaned_user_input
        |> String.graphemes()
        |> Enum.map(&String.to_integer/1)

      # Calculation of the first verification digit
      d1_digit1 = Enum.at(cpf_int_array, 0) * 1
      d1_digit2 = Enum.at(cpf_int_array, 1) * 2
      d1_digit3 = Enum.at(cpf_int_array, 2) * 3
      d1_digit4 = Enum.at(cpf_int_array, 3) * 4
      d1_digit5 = Enum.at(cpf_int_array, 4) * 5
      d1_digit6 = Enum.at(cpf_int_array, 5) * 6
      d1_digit7 = Enum.at(cpf_int_array, 6) * 7
      d1_digit8 = Enum.at(cpf_int_array, 7) * 8
      d1_digit9 = Enum.at(cpf_int_array, 8) * 9

      d1_sum = d1_digit1 + d1_digit2 + d1_digit3 + d1_digit4 + d1_digit5 + d1_digit6 + d1_digit7 + d1_digit8 + d1_digit9

      d1 = if rem(d1_sum, 11) <= 9 do
        rem(d1_sum, 11)
      else
        0
      end

      # Calculation of the second verification digit
      d2_digit1 = Enum.at(cpf_int_array, 0) * 0
      d2_digit2 = Enum.at(cpf_int_array, 1) * 1
      d2_digit3 = Enum.at(cpf_int_array, 2) * 2
      d2_digit4 = Enum.at(cpf_int_array, 3) * 3
      d2_digit5 = Enum.at(cpf_int_array, 4) * 4
      d2_digit6 = Enum.at(cpf_int_array, 5) * 5
      d2_digit7 = Enum.at(cpf_int_array, 6) * 6
      d2_digit8 = Enum.at(cpf_int_array, 7) * 7
      d2_digit9 = Enum.at(cpf_int_array, 8) * 8
      d2_digit10 = d1 * 9

      d2_sum = d2_digit1 + d2_digit2 + d2_digit3 + d2_digit4 + d2_digit5 + d2_digit6 + d2_digit7 + d2_digit8 + d2_digit9 + d2_digit10

      d2 = if rem(d2_sum, 11) <= 9 do
        rem(d2_sum, 11)
      else
        0
      end

      # Checking if the CPF is valid
      if Enum.at(cpf_int_array, 9) == d1 && Enum.at(cpf_int_array, 10) == d2 do
        IO.puts("Valid CPF!")
      else
        IO.puts("Invalid CPF!")
      end
    else
      IO.puts("Invalid CPF!")
    end
  end

  defp valid_cpf?(cpf) do
    # Check if the CPF length is exactly 11 and contains only digits
    String.length(cpf) == 11 && String.match?(cpf, ~r/^\d+$/)
  end
end
