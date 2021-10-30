# return an array containing the 
    # colors of the fruits - Capitalized
    # sizes of vegetables - UPPERCASED


hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.each_with_object([]) do |(key, value), array|
  if hsh[key][:type] == 'fruit'
    array << hsh[key][:colors].map {|color| color.capitalize}
  elsif hsh[key][:type] == 'vegetable'
    array << hsh[key][:size].upcase 
  end
end


# LS Solution
hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
