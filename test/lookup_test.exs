Code.require_file "test_helper.exs", __DIR__

defmodule LookupTest do
  use ExUnit.Case

  test "Knows how to handle #" do
    markdown = Scribe.Lookup.markdown("#")
    heading = "h1"
    assert markdown == heading
  end

  test "Knows how to handle ##" do
    markdown = Scribe.Lookup.markdown("##")
    heading = "h2"
    assert markdown == heading
  end

end
