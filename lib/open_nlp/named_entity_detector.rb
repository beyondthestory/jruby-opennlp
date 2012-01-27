module OpenNLP
  class NamedEntityDetector
    attr_reader :j_named_entity_detector_me

    def initialize(model)
      raise ArgumentError, "model must be an OpenNLP::NamedEntityDetector::Model" unless model.is_a?(OpenNLP::NamedEntityDetector::Model)
      @j_named_entity_detector_me = Java::opennlp.tools.namefind.NameFinderME.new(model.j_token_name_finder_model)
    end

    def detect(tokens)
      @j_named_entity_detector_me.find(tokens.to_java(:String)).to_ary
    end
  end
end
