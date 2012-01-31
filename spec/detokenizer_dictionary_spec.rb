require 'spec_helper'

describe OpenNLP::Detokenizer::Dictionary do
  describe "initialisation" do
    context "from a filename string" do
      subject { OpenNLP::Detokenizer::Dictionary.new(dd_file_name) }

      it { should be_a(OpenNLP::Detokenizer::Dictionary) }
      its(:j_detokenizer_dictionary) { should be_a(Java::opennlp.tools.tokenize.DetokenizationDictionary) }
    end

    context "from a java.io.FileInputStream" do
      subject { OpenNLP::Detokenizer::Dictionary.new(dd_file_fis) }

      it { should be_a(OpenNLP::Detokenizer::Dictionary) }
      its(:j_detokenizer_dictionary) { should be_a(Java::opennlp.tools.tokenize.DetokenizationDictionary) }
    end

    it "should raise an ArgumentError otherwise" do
      expect { OpenNLP::Detokenizer::Dictionary.new(nil) }.to raise_error(ArgumentError)
    end
  end
end

def dd_file_name
  File.join(FIXTURES_DIR, "en-detokenizer.xml")
end

def dd_file_fis
  java.io.FileInputStream.new(dd_file_name)
end
