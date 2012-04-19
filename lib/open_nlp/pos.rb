module OpenNLP
  class POSTagger
    attr_reader :j_pos_tagger_me

    def initialize(model)
      raise ArgumentError, "model must be an OpenNLP::POS::Model" unless model.is_a?(OpenNLP::POS::Model)
      @j_pos_tagger_me = Java::opennlp.tools.postag.POSTaggerME.new(model.j_pos_tagger_model)
    end

    def tag(tokens)
      @j_pos_tagger_me.tag(tokens.to_java(:String)).to_ary
    end
  end
end
