Code.require_file "test_helper.exs", __DIR__

defmodule TranslateTest do
  use ExUnit.Case

  test "it translates # to h1" do
    translated_markdown = Scribe.Translate.run("# Example")
    heading = "<h1>Example</h1>"
    assert translated_markdown == heading
  end

  test "it translates ## to h2" do
    translated_markdown = Scribe.Translate.run("## Example")
    heading = "<h2>Example</h2>"
    assert translated_markdown == heading
  end

  test "it translates # Example # to an h1" do
    translated_markdown = Scribe.Translate.run("# Example #")
    heading = "<h1>Example</h1>"
    assert translated_markdown == heading
  end

  test "it handles multiple words in a tag" do
    translated_markdown = Scribe.Translate.run("# Hello World")
    heading = "<h1>Hello World</h1>"
    assert translated_markdown == heading
  end
end
