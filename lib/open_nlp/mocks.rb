# When running under MRI, this is all of the jruby-opennlp gem. The intent is to provide
# the class stucture to allow for mocking the gem. It would be advisable to mock out the
# calls to OpenNLP during tests regardless of the platform being used - the model initialisation
# can run to 20+ seconds (in the case of the named entity recogniser models), and slow things
# down considerably.

module OpenNLP
  class Tokenizer
    class Model
    end
  end

  class SentenceDetector
    class Model
    end
  end

  class NamedEntityDetector
    class Model
    end
  end

  class Detokenizer
    class Dictionary
    end
  end
end
