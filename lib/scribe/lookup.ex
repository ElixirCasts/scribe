defmodule Scribe.Lookup do

  def markdown(tag="#"<>_) do
    "h#{String.length tag}"
  end

end