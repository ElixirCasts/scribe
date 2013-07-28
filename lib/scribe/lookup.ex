defmodule Scribe.Lookup do

  def markdown(tag="#"<>_) do
    "h#{String.length tag}"
  end

  def markdown("="<>_) do
    "h1"
  end

  def markdown("-"<>_) do
    "h2"
  end

  def markdown("") do
    "p"
  end
end