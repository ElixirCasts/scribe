defmodule Scribe.Translator do
  use GenServer.Behaviour

  def handle_call({:translate, text}, _from, state) do
    {response_text, current_text} = run [text | state]
    { :reply, response_text, current_text }
  end

  # Translations
  
  def run(markdown) do
    markdown 
    |> get_markdown_symbol
    |> html_to_markdown
    |> translate
  end
  
  def get_markdown_symbol(markdown) do
    [h | t] = markdown
    cond do
      Regex.match?(%r/\#[\s\w]+/, h) ->
        [md: tag, text: text] = Regex.captures(%r/(?<md>\W+)(?<text>[\w\s]+)/g, h)
        tag = String.strip(tag)
        text = String.strip(text)
        {:match, tag, text, markdown}
      Regex.match?(%r/[=-]+/, h) ->
        tag = String.strip(h)
        [extracted_text] = t
        text = String.strip(extracted_text)
        {:match, tag, text, markdown}
          
      true ->
        {:no_match, markdown}
    end
  end
  
  def translate({:match, tag, text, context}) do
    {"<#{tag}>#{text}</#{tag}>", []}
  end
  
  def html_to_markdown({:match, markdown_tag, text, context})  do
    html_tag =  Scribe.Lookup.markdown(markdown_tag)
    {:match, html_tag, text, context}
  end

  def translate({:no_match, context}) do
    {"", context}
  end
  
  def html_to_markdown({:no_match, context})  do
    {:no_match, context}
  end
end