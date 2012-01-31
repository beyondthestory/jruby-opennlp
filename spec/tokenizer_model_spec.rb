require "spec_helper"

describe "OpenNLP::Tokenizer::Model" do
  context "initialisation" do
    it "should accept a string filename parameter" do
      tokenizer_model = OpenNLP::Tokenizer::Model.new(model_file_name)
      tokenizer_model.should be_a(OpenNLP::Tokenizer::Model)
      tokenizer_model.j_tokenizer_model.should be_a(Java::opennlp.tools.tokenize.TokenizerModel)
    end

    it "should accept a java.io.FileInputStream object" do
      file_input_stream = java.io.FileInputStream.new(model_file_name)
      tokenizer_model = OpenNLP::Tokenizer::Model.new(file_input_stream)
      tokenizer_model.should be_a(OpenNLP::Tokenizer::Model)
      tokenizer_model.j_tokenizer_model.should be_a(Java::opennlp.tools.tokenize.TokenizerModel)
    end

    it "should raise an argument error otherwise" do
      lambda { OpenNLP::Tokenizer::Model.new(nil) }.should raise_error(ArgumentError)
    end
  end
end

def model_file_name
  File.join(FIXTURES_DIR, "en-token.bin")
end
