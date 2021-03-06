# frozen_string_literal: true

class Flor::Pro::Ceach < Flor::Macro::Iterator
  #
  # Concurrent "each".
  #
  # ```
  # ceach [ alice bob charly ]
  #   task elt "prepare monthly report"
  # ```
  # which is equivalent to
  # ```
  # concurrence
  #   task 'alice' "prepare monthly report"
  #   task 'bob' "prepare monthly report"
  #   task 'charly' "prepare monthly report"
  # ```
  #
  # ## see also
  #
  # For-each, c-map, and c-for-each.

  names %w[ ceach c-each ]

  def rewrite_tree

    rewrite_iterator_tree('c-for-each')
  end
end

