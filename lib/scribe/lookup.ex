defmodule Scribe.Lookup do
  @markdown_single_line [{"#", "h1"},
                         {"##", "h2"},
                         {"###", "h3"},
                         {"####", "h4"},
                         {"#####", "h5"},
                         {"######", "h6"}]

  def markdown(tag) do
    @markdown_single_line[tag]
  end
end