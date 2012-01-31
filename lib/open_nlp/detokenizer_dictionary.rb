module OpenNLP
  class Detokenizer
    class Dictionary
      attr_reader :j_detokenizer_dictionary

      def initialize(dict)
        case dict
        when String
          dict_fis = java.io.FileInputStream.new(dict)
          @j_detokenizer_dictionary = Java::opennlp.tools.tokenize.DetokenizationDictionary.new(dict_fis)
        when java.io.FileInputStream
          @j_detokenizer_dictionary = Java::opennlp.tools.tokenize.DetokenizationDictionary.new(dict)
        else
          raise ArgumentError, "dict must be either a String or java.io.FileInputStream"
        end
      end
    end
  end
end
