require "spec_helper"

describe "OpenNLP::SentenceDetector::Model" do
  describe "initialisation" do
    it "should accept a java.io.FileInputStream object" do
      file_input_stream = java.io.FileInputStream.new(sent_model_file_name)
      sent_detect_model = OpenNLP::SentenceDetector::Model.new(file_input_stream)
      sent_detect_model.should be_a(OpenNLP::SentenceDetector::Model)
      sent_detect_model.j_sentence_model.should be_a(Java::opennlp.tools.sentdetect.SentenceModel)
    end

    it "should accept a string filename" do
      sent_detect_model = OpenNLP::SentenceDetector::Model.new(sent_model_file_name)
      sent_detect_model.should be_a(OpenNLP::SentenceDetector::Model)
      sent_detect_model.j_sentence_model.should be_a(Java::opennlp.tools.sentdetect.SentenceModel)
    end

    it "should raise an argument error otherwise" do
      lambda { OpenNLP::SentenceDetector::Model.new(nil) }.should raise_error(ArgumentError)
    end
  end
end

def sent_model_file_name
  File.join(FIXTURES_DIR, "en-sent.bin")
end
