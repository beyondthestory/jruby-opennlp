require File.dirname(__FILE__) + "/spec_helper"

describe "OpenNLP::NamedEntityDetector::Model" do
  describe "initialisation" do
    it "should load a model from a filename string" do
      ner_model = OpenNLP::NamedEntityDetector::Model.new(ner_model_file_name)
      ner_model.should be_a(OpenNLP::NamedEntityDetector::Model)
      ner_model.j_token_name_finder_model.should be_a(Java::opennlp.tools.namefind.TokenNameFinderModel)
    end

    it "should load a model from a java.io.FileInputStream" do
      new_model_fis = java.io.FileInputStream.new(ner_model_file_name)
      ner_model = OpenNLP::NamedEntityDetector::Model.new(new_model_fis)
      ner_model.should be_a(OpenNLP::NamedEntityDetector::Model)
      ner_model.j_token_name_finder_model.should be_a(Java::opennlp.tools.namefind.TokenNameFinderModel)
    end

    it "should raise an ArgumentError otherwise" do
      lambda { OpenNLP::NamedEntityDetector::Model.new(nil) }.should raise_error(ArgumentError)
    end
  end
end

def ner_model_file_name
  File.join(FIXTURES_DIR, "en-ner-time.bin")
end
