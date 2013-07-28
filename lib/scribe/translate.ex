defmodule Scribe.Translate do
  def run(markdown_file) do
    { :ok, pid } = :gen_server.start_link(Scribe.Translator, [], [])
    markdown_file
    |> String.split("\n")
    |> Enum.map(fn(item) -> :gen_server.call(pid, {:translate, item}) end)
    |> Enum.filter(fn(item) -> (String.length(item) > 0) end)
    |> Enum.join("\n")
    
  end

end