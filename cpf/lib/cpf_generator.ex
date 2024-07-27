defmodule CpfGenerator do
  def generate do
    #Generating a 9-digit random interger number
    random_number = :rand.uniform(1_000_000_000) - 1

    cpf_base =
      random_number
      |> Integer.to_string()
      |> String.graphemes()
      |> Enum.map(&String.to_integer/1)

    # Generating the first verified digit
    d1_digit1 = Enum.at(cpf_base, 0) * 1
    d1_digit2 = Enum.at(cpf_base, 1) * 2
    d1_digit3 = Enum.at(cpf_base, 2) * 3
    d1_digit4 = Enum.at(cpf_base, 3) * 4
    d1_digit5 = Enum.at(cpf_base, 4) * 5
    d1_digit6 = Enum.at(cpf_base, 5) * 6
    d1_digit7 = Enum.at(cpf_base, 6) * 7
    d1_digit8 = Enum.at(cpf_base, 7) * 8
    d1_digit9 = Enum.at(cpf_base, 8) * 9

    d1_sum = d1_digit1 + d1_digit2 + d1_digit3 + d1_digit4 + d1_digit5 + d1_digit6 + d1_digit7 + d1_digit8 + d1_digit9

    d1 = if rem(d1_sum, 11) <= 9 do
      rem(d1_sum, 11)
    else
      0
    end

    # Generating the second verified digit
    d2_digit1 = Enum.at(cpf_base, 0) * 0
    d2_digit2 = Enum.at(cpf_base, 1) * 1
    d2_digit3 = Enum.at(cpf_base, 2) * 2
    d2_digit4 = Enum.at(cpf_base, 3) * 3
    d2_digit5 = Enum.at(cpf_base, 4) * 4
    d2_digit6 = Enum.at(cpf_base, 5) * 5
    d2_digit7 = Enum.at(cpf_base, 6) * 6
    d2_digit8 = Enum.at(cpf_base, 7) * 7
    d2_digit9 = Enum.at(cpf_base, 8) * 8
    d2_digit10 = d1 * 9

    d2_sum = d2_digit1 + d2_digit2 + d2_digit3 + d2_digit4 + d2_digit5 + d2_digit6 + d2_digit7 + d2_digit8 + d2_digit9 + d2_digit10

    d2 = if rem(d2_sum, 11) <= 9 do
      rem(d2_sum, 11)
    else
      0
    end

    # Creating a new variable to add both generated digits into the cpf_base
    generated_cpf = cpf_base ++ [d1, d2]

    # Converting the final result into string
    cpf =
      generated_cpf
      |> Enum.map(&Integer.to_string/1)
      |> Enum.join("")

    # Formatting CPF
    formatted_cpf =
      cpf
      |> String.slice(0, 3)
      |> Kernel.<>( ".")
      |> Kernel.<>(String.slice(cpf, 3, 3))
      |> Kernel.<>( ".")
      |> Kernel.<>(String.slice(cpf, 6, 3))
      |> Kernel.<>( "-")
      |> Kernel.<>(String.slice(cpf, 9, 2))
  end
end
