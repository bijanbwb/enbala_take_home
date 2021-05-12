defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list()) :: non_neg_integer()
  def count([]), do: 0
  def count([_head | tail]), do: 1 + count(tail)

  @spec reverse(list()) :: list()
  def reverse(list), do: reverse(list, [])
  defp reverse([], acc), do: acc
  defp reverse([head | tail], acc), do: reverse(tail, [head | acc])

  @spec map(list(), (any() -> any())) :: list()
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  @spec filter(list(), (any -> as_boolean(term()))) :: list()
  def filter([], _func), do: []

  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  @type acc :: any()
  @spec reduce(list(), acc(), (any(), acc() -> acc())) :: acc()
  def reduce([], acc, _func), do: acc
  def reduce([head | tail], acc, func), do: reduce(tail, func.(head, acc), func)

  @spec append(a :: list(), b :: list()) :: list()
  def append([], []), do: []
  def append(a, []), do: a
  def append([], b), do: b
  def append([head | tail], b), do: [head | append(tail, b)]

  @spec concat(list(list(any()))) :: list(any())
  def concat([]), do: []
  def concat([head | tail]), do: append(head, concat(tail))
end
