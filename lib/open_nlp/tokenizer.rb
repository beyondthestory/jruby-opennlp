module OpenNLP
  class Tokenizer
    def initialize(model)
      raise ArgumentError, "model must be an OpenNLP::Tokenizer::Model" unless model.is_a?(Tokenizer::Model)
      @j_tokenizer = Java::opennlp.tools.tokenize.TokenizerME.new(model.j_tokenizer_model)
    end

    def tokenize(str)
      raise ArgumentError, "str must be a String" unless str.is_a?(String)
      @j_tokenizer.tokenize(str).to_ary
    end
  end
end
