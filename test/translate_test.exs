Code.require_file "test_helper.exs", __DIR__

defmodule TranslateTest do
  use ExUnit.Case

   test "it handles multiple lines of input" do
    translated_markdown = Scribe.Translate.run("# Hello\n## World")
    heading = "<h1>Hello</h1>\n<h2>World</h2>"
    assert translated_markdown == heading
  end

   test "it handles multiline blocks of input" do
    translated_markdown = Scribe.Translate.run("Hello World!\n=====")
    heading = "<h1>Hello World!</h1>"
    assert translated_markdown == heading
  end

   test "it handles several tags in a block of text" do
    translated_markdown = Scribe.Translate.run("Hello World!\n=====\nExample\n")
    heading = "<h1>Hello World!</h1>\n<p>Example</p>"
    assert translated_markdown == heading
  end
end
