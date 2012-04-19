require "spec_helper"

describe "OpenNLP::POSTagger" do
  describe "initialisation" do
    it "should initialise with a valid model" do
      sent_detector = OpenNLP::POSTagger.new(fixture_sd_model)
      sent_detector.should be_a(OpenNLP::POSTagger)
      sent_detector.j_sentence_detector_me.should be_a(Java::opennlp.tools.sentdetect.POSTaggerME)
    end

    it "should raise an ArgumentError without a valid model" do
      lambda { OpenNLP::POSTagger.new(nil) }.should raise_error(ArgumentError)
    end
  end

  describe "pos tagging" do
    before { @pos_tagger = OpenNLP::POSTagger.new(fixture_pos_model) }

    it "should detect no sentences in an empty string" do
      tagged = @pos_tagger.tag("The red fox sleeps soundly.")
      tagged.should == ["The", "red", "fox", "sleeps", "soundly", "."]
    end

    it "should raise an ArgumentError for a non-string" do
      lambda { @posr.tag(nil) }.should raise_error(ArgumentError)
    end
  end
end

def fixture_pos_model
  OpenNLP::POSTagger::Model.new(File.join(FIXTURES_DIR, "en-pos-maxent.bin"))
end
