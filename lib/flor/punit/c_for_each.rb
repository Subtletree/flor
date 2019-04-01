
require 'flor/punit/citerator'


class Flor::Pro::CforEach < Flor::Pro::ConcurrentIterator
  #
  # Concurrent "for-each", launches a concurrent branch for each elt or entry
  # of the incoming collection.
  #
  # ```
  # c-for-each [ 'alice' 'bob' 'charly' ]
  #   def user \ task user 'contact customer group'
  #     #
  #     # is thus equivalent to
  #     #
  # task 'alice' 'contact customer group'
  # task 'bob' 'contact customer group'
  # task 'charly' 'contact customer group'
  # ```
  #
  # By default, the incoming `f.ret` collection is used:
  # ```
  # [ 'alice' 'bob' 'charly' ]
  # c-for-each
  #   def user \ task user 'contact customer group'
  # ```
  #
  # ## see also
  #
  # For-each, cmap, and ceach.

  name 'c-for-each'

  protected

  def receive_ret

    if (@node['cnt'] -= 1) > 0 # still waiting for answers
      []
    else # over
      wrap('ret' => @node['col'])
    end
  end
end

