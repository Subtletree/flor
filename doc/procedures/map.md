
# map

This is the classical "map" procedure. It accepts a collection
and a function and yields a new collection.

```
map [ 1, 2, 3 ]
  def x
    + x 3
# f.ret yields [ 4, 5, 6 ]
```

The collection if not given is taken from `f.ret`:
```
[ 1, 2, 3 ]
map
  def x
    + x 2
# f.ret yields [ 3, 4, 5 ]
```

The function may be given by reference:
```
define add3 x
  + x 3
map [ 0, 1 ] add3
```

There is an implicit `idx` var:
```
map [ 'a', 'b' ]
  def x \ [ idx, x ]
# f.ret yields [ [ 0, 'a' ], [ 1, 'b' ] ]
```
but that index can be included in the function signature:
```
map [ 'a', 'b' ]
  def x i \ [ x, i ]
# f.ret yields [ [ 'a', 0 ], [ 'b', 1 ] ]
```

## see also

[Collect](collect.md).


* [source](https://github.com/floraison/flor/tree/master/lib/flor/pcore/map.rb)
* [map spec](https://github.com/floraison/flor/tree/master/spec/pcore/map_spec.rb)
