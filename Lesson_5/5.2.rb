#objective: order the hashes based on the year of publication from earliest to latest


# earliest year is 1869, latest is 1967
# How do I select the published year?
  # books[element_index][:published] #=> the value associated to that published key

# How do I order by published year?
  # I can use sort, sort_by, <=>. I must first convert the string into an integer 

# What is the output I want?
  # array of the 4 elements in order by publish date from earliest to latest

# How can I compare each element and the publish dates between them?
  # sort_by 

books = [
  {title: 'One Hundred Years of Solitude', 
  author: 'Gabriel Garcia Marquez', 
  published: '1967'},
  
  {title: 'The Great Gatsby', 
  author: 'F. Scott Fitzgerald', 
  published: '1925'},

  {title: 'War and Peace', 
  author: 'Leo Tolstoy', 
  published: '1869'},

  {title: 'Ulysses', 
  author: 'James Joyce', 
  published: '1922'}
]


books.sort_by do |hash|
  hash[:published].to_i
end

books.sort do |hash,hash2|
  hash[:published].to_i <=> hash2[:published].to_i
end