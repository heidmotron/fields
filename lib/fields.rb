require 'treetop'
require "fields/version"
require 'fields/parser'

module Fields
  def Fields.parse(input)
    parser = FieldsGrammarParser.new
    result = parser.parse(input)
    result ? result.value : result
  end
end
