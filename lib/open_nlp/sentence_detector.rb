module OpenNLP
  class SentenceDetector
    attr_reader :j_sentence_detector_me

    def initialize(model)
      raise ArgumentError unless model.is_a?(OpenNLP::SentenceDetector::Model)
      @j_sentence_detector_me = Java::opennlp.tools.sentdetect.SentenceDetectorME.new(model.j_sentence_model)
    end

    def detect(string)
      raise ArgumentError, "string must be a String" unless string.is_a?(String)
      @j_sentence_detector_me.sentDetect(string).to_ary
    end
  end
end
