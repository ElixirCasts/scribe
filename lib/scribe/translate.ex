defmodule Scribe.Translate do
  def run(markdown) do
    markdown 
    |> get_markdown_symbol
    |> html_to_markdown
    |> translate
  end
  
  
  def get_markdown_symbol(markdown) do
    cond do
      Regex.match?(%r/\W[\s\w]+/, markdown) ->
        [md: tag, text: text] = Regex.captures(%r/(?<md>\W+)(?<text>[\w\s]+)/g, markdown)
        tag = String.strip(tag)
        text = String.strip(text)
        {:match, tag, text}
    end
  end
  
  def translate({:match, tag, text}) do
    "<#{tag}>#{text}</#{tag}>"
  end
  
  def html_to_markdown({:match, markdown_tag, text})  do
    html_tag =  Scribe.Lookup.markdown(markdown_tag)
    {:match, html_tag, text}
  end
end