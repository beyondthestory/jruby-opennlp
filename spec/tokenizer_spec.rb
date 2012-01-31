require "spec_helper"

describe "OpenNLP::Tokenizer" do
  context "initialisation" do
    it "should initialise a new tokeniser" do
      tokenizer = OpenNLP::Tokenizer.new(fixture_model)
      tokenizer.should be_a(OpenNLP::Tokenizer)
    end

    it "should raise an argument error when no model is supplied" do
      lambda { OpenNLP::Tokenizer.new(nil) }.should raise_error(ArgumentError)
    end
  end

  context "tokenizing a string" do
    before { @tokenizer = OpenNLP::Tokenizer.new(fixture_model) }

    it "should tokenize an empty string" do
      tokens = @tokenizer.tokenize("")
      tokens.should == []
    end

    it "should tokenize a sentence" do
      tokens = @tokenizer.tokenize("The red fox sleeps soundly.")
      tokens.should == ["The", "red", "fox", "sleeps", "soundly", "."]
    end

    it "should raise an error when not passed a string" do
      lambda { @tokenizer.tokenize(nil) }.should raise_error(ArgumentError)
    end
  end
end

def fixture_model
  model_file_name = File.join(FIXTURES_DIR, "en-token.bin")
  OpenNLP::Tokenizer::Model.new(model_file_name)
end
