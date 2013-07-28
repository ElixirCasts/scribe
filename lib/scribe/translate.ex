defmodule Scribe.Translate do
  def run(markdown_file) do
    { :ok, pid } = :gen_server.start_link(Scribe.Translator, "", [])
    processed_list = markdown_file
    |> String.split("\n")

    Enum.map(processed_list,
             fn(item) -> :gen_server.call(pid, {:translate, item}) end)
    |> Enum.join("\n")
  end

end