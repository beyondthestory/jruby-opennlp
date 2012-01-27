require File.dirname(__FILE__) + "/spec_helper"

describe "OpenNLP::NamedEntityDetector" do
  describe "initialisation" do
    it "should initialise with a valid model" do
      ne_detector = OpenNLP::NamedEntityDetector.new(fixture_ne_model)
      ne_detector.should be_a(OpenNLP::NamedEntityDetector)
    end

    it "should raise an ArgumentError otherwise" do
      lambda { OpenNLP::NamedEntityDetector.new(nil) }.should raise_error(ArgumentError)
    end
  end

  describe "detection" do
    before { @ne_detector = OpenNLP::NamedEntityDetector.new(fixture_ne_model) }

    it "should detect nothing in an empty sentence" do
      spans = @ne_detector.detect([])
      spans.should be_a(Array)
      spans.length.should == 0
    end

    it "should detect the named entities" do
      spans = @ne_detector.detect(["The", "time", "is", "10", ":", "23", "am"])
      spans.should be_a(Array)
      spans[0].should be_a(Java::opennlp.tools.util.Span)
      spans[0].getStart.should == 3
      spans[0].getEnd.should == 7
    end

    it "should raise an error if anything but an array is passed" do
    end
  end
end

def fixture_ne_model
  OpenNLP::NamedEntityDetector::Model.new(File.join(FIXTURES_DIR, "en-ner-time.bin"))
end
