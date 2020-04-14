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
  apology_message = "Sorry, that emoticon was not found"

  emoji = library.any? do |meaning, emoticons|
     value_present = emoticons.has_value?(string)
      if value_present == true
        return meaning
      end #end if statement
  end # end outer Enumerator
  if emoji == false
    return apology_message
  end
end #close definition

def get_japanese_emoticon (file, emoticon_input)
  # code goes here
  library = load_library(file)
  emotion = get_english_meaning(file, emoticon_input)
  if emotion == "Sorry, that emoticon was not found"
    return emotion
  else
    return library[emotion][:japanese]
  end

end
