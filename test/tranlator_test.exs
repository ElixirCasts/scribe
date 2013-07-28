Code.require_file "test_helper.exs", __DIR__

defmodule TranslatorTest do
  use ExUnit.Case
  test "it translates # to h1" do
    translated_markdown = Scribe.Translator.run(["# Example"])
    heading = {"<h1>Example</h1>", []}
    assert translated_markdown == heading
  end

  test "it translates ## to h2" do
    translated_markdown = Scribe.Translator.run(["## Example"])
    heading = {"<h2>Example</h2>", []}
    assert translated_markdown == heading
  end

  test "it translates # Example # to an h1" do
    translated_markdown = Scribe.Translator.run(["# Example #"])
    heading = {"<h1>Example</h1>", []}
    assert translated_markdown == heading
  end

  test "it handles multiple words in a tag" do
    translated_markdown = Scribe.Translator.run(["# Hello World"])
    heading = {"<h1>Hello World</h1>", []}
    assert translated_markdown == heading
  end

 test "it handles multi-line h1 headers" do
    translated_markdown = Scribe.Translator.run(["=", "Example"])
    heading = {"<h1>Example</h1>", []}
    assert translated_markdown == heading
 end

 test "it handles multi-line h2 headers" do
    translated_markdown = Scribe.Translator.run(["-", "Example"])
    heading = {"<h2>Example</h2>", []}
    assert translated_markdown == heading
 end

  test "it handles multi-line paragraphs headers" do
    translated_markdown = Scribe.Translator.run(["", "World", "Hello"])
    heading = {"<p>Hello\nWorld</p>", []}
    assert translated_markdown == heading
 end
end
