module Fields
  def self.parse(input)
    return nil if input.nil?
    return nil unless input =~ /^[a-z_,\(\)]+$/

    working = input.clone
    subtrees = []
    while working.index('(')
      data = /([a-z_]+\([^\(\)]+\))/.match(working)
      return nil if data.nil?

      data.captures.each do |substring|
        subtrees << substring
        working.sub!(substring, "$#{subtrees.length - 1}")
      end
    end

    return nil unless working =~ /^[a-z0-9\$,_]+$/
    build_tree(subtrees, working)
  end

  private
  def self.build_tree(subtrees, input)
    items = input.split(',')
    items.map do |item|
      if item.start_with?('$')
        substring = subtrees[item[1..-1].to_i]
        open_paren_at = substring.index('(')
        key = substring[0..open_paren_at-1]
        subtree = build_tree(subtrees, substring[open_paren_at+1..-2])
        { key => subtree }
      else
        item
      end
    end
  end
end

