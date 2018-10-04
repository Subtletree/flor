
# downcase, lowercase, lowcase, upcase, uppercase, capitalize, snakecase, snake_case

"downcase", "upcase", "capitalize", etc.

"downcase", "lowercase", "lowcase",
"upcase", "uppercase",
"capitalize",
"snakecase", "snake_case"

```
downcase 'HELLO'           # => 'hello'
'HELLO'; downcase _        # => 'hello'
'HELLO'; downcase 'WORLD'  # => 'world'
# ...
```

## objects and arrays

Please note:

```
[ "A" "BC" "D" ]; downcase _    # => [ 'a' 'bc' 'd' ]
{ a: "A" b: "BC" }; downcase _  # => { a: 'a', b: 'bc' }
```

## see also

[length](length.md), [reverse](reverse.md)


* [source](https://github.com/floraison/flor/tree/master/lib/flor/pcore/strings.rb)
