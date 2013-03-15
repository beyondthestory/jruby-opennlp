require "spec_helper"

describe "OpenNLP::POSTagger::Model" do
  context "initialisation" do
    it "should accept a string filename parameter" do
      postagger_model = OpenNLP::POSTagger::Model.new(model_file_name)
      postagger_model.should be_a(OpenNLP::POSTagger::Model)
      postagger_model.j_pos_model.should be_a(Java::opennlp.tools.postag.POSModel)
    end

    it "should accept a java.io.FileInputStream object" do
      file_input_stream = java.io.FileInputStream.new(model_file_name)
      postagger_model = OpenNLP::POSTagger::Model.new(file_input_stream)
      postagger_model.should be_a(OpenNLP::POSTagger::Model)
      postagger_model.j_pos_model.should be_a(Java::opennlp.tools.postag.POSModel)
    end

    it "should raise an argument error otherwise" do
      lambda { OpenNLP::POSTagger::Model.new(nil) }.should raise_error(ArgumentError)
    end
  end
end

def model_file_name
  File.join(FIXTURES_DIR, "en-pos-maxent.bin")
end
