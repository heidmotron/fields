require 'treetop'
require "fields/version"
require 'fields/parser'

module Fields
  def Fields.parse(input)
    parser = FieldsGrammarParser.new
    parser.parse(input).value
  end
end
