
module Flor

  module FlorModel

    def unit; self.class.unit; end
    def storage; unit.storage; end

    # Return a Flor::Execution instance linked to this model
    #
    def execution(reload=false)

      exid = @values[:exid]; return nil unless exid

      @flor_model_cache_execution = nil if reload

      @flor_model_cache_execution ||= unit.executions[exid: exid]
    end

    # Returns the node hash linked to this model
    #
    def node(reload=false)

      nid = @values[:nid]; return nil unless nid
      exe = execution(reload); return nil unless exe

      nodes = exe.data['nodes']; return nil unless nodes
      nodes[nid]
    end

    def payload(reload=false)

      nod = node(reload)
      nod ? nod['payload'] : nil
    end

    def data(cache=true)

      cache ? (@flor_model_cache_data = _data) : _data
    end

    def refresh

      instance_variables
        .each do |k|
          instance_variable_set(k, nil) \
            if k.to_s.start_with?('@flor_model_cache_')
        end

      super
    end

    def to_h

      values.inject({}) do |h, (k, v)|
        if k == :content
          h[:data] = data
        else
          h[k] = v
        end
        h
      end
    end

    alias to_dump_h to_h
      #
      # Downsteam, #to_h answers are more complete, more standalone
      # whereas, #to_dump_h answers are more compact (see florist).
      # For now, they're just the same, it specializes downstream.

    class << self

      def from_h(h)

        cols = columns

        h
          .inject({}) { |r, (k, v)|
            k = k.to_sym
            if k == :data
              r[:content] = Flor.to_blob(v)
            elsif cols.include?(k)
              r[k] = v
            end
            r }
      end
    end

    protected

    def _data

      d = Flor::Storage.from_blob(content)
      d['id'] = id if d.is_a?(Hash)

      d
    end
  end
end
