defmodule Floki.CssParser do
  def parse(selector) do
    {:ok, tokens, _} = :list_lexer.string(selector)
    :list_parser.parse(tokens)
  end
end
