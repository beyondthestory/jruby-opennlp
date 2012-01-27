require File.dirname(__FILE__) + "/spec_helper"

describe "OpenNLP::SentenceDetector" do
  describe "initialisation" do
    it "should initialise with a valid model" do
      sent_detector = OpenNLP::SentenceDetector.new(fixture_sd_model)
      sent_detector.should be_a(OpenNLP::SentenceDetector)
      sent_detector.j_sentence_detector_me.should be_a(Java::opennlp.tools.sentdetect.SentenceDetectorME)
    end

    it "should raise an ArgumentError without a valid model" do
      lambda { OpenNLP::SentenceDetector.new(nil) }.should raise_error(ArgumentError)
    end
  end

  describe "sentence detection" do
    before { @sent_detector = OpenNLP::SentenceDetector.new(fixture_sd_model) }

    it "should detect no sentences in an empty string" do
      sentences = @sent_detector.detect("")
      sentences.should == []
    end

    it "should detect sentences in a string" do
      sentences = @sent_detector.detect("The sky is blue. The Grass is green.")
      sentences.should == ["The sky is blue.", "The Grass is green."]
    end

    it "should raise an ArgumentError for a non-string" do
      lambda { @sent_detector.detect(nil) }.should raise_error(ArgumentError)
    end
  end
end

def fixture_sd_model
  OpenNLP::SentenceDetector::Model.new(File.join(FIXTURES_DIR, "en-sent.bin"))
end
