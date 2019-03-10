
# Parent class for "c-for-each" and "c-map"
#
class Flor::Pro::ConcurrentIterator < Flor::Procedure

  def pre_execute

    @node['args'] = []
    @node['col'] = nil

    unatt_unkeyed_children
  end

  def receive_non_att

    if @node['col']
      receive_ret
    else
      @node['args'] << payload['ret']
      super
    end
  end

  def receive_last

    if @node['col']
      super
    else
      receive_last_argument
    end
  end

  protected

  def receive_last_argument

    col = nil
    fun = nil
    @node['args'].each do |a|
      if Flor.is_func_tree?(a)
        fun = a
      elsif Flor.is_collection?(a)
        col = a
      end
    end
    col ||= node_payload_ret

    fail Flor::FlorError.new("collection not given to #{heap.inspect}", self) \
      unless Flor.is_collection?(col)
    return wrap('ret' => col) \
      unless Flor.is_func_tree?(fun)

    @node['col'] = col
    @node['cnt'] = col.size

    col
      .collect
      .with_index { |e, i|
        apply(fun, determine_iteration_args(col, i), tree[2]) }
      .flatten(1)
  end

  def determine_iteration_args(col, idx)

    args =
      if col.is_a?(Array)
        [ [ 'elt', col[idx] ] ]
      else
        e = col.to_a[idx]
        [ [ 'key', e[0] ], [ 'val', e[1] ] ]
      end
    args << [ 'idx', idx ]
    args << [ 'len', col.length ]

    args
  end
end
