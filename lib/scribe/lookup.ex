defmodule Scribe.Lookup do
  def markdown("#") do
    "h1"
  end

  def markdown("##") do
    "h2"
  end
end