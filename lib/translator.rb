# require modules here
#!/usr/bin/env ruby
require 'pry'
require 'yaml'

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)

  result = emoticons.reduce({}) do |memo, (meaning, emoticons)|
    definition_hash = {:english => "",:japanese => ""}

      definition_hash[:english] = emoticons[0]
      definition_hash[:japanese] = emoticons[1]
      memo[meaning] = definition_hash
      memo
    end
    result
end


def get_english_meaning(file, string)
  # code goes here
  library = load_library(file)
  library.each do |meaning, emoticons|
     emoticons.any? do |language, characters|
      if string == characters
        return meaning
      end
    end
  end
end

def get_japanese_emoticon (file, emoticon_input)
  # code goes here
  library = load_library(file)
  emotion = get_english_meaning(file, emoticon_input)
  return library[emotion][:japanese]

end
