
class Flor::Pro::Path < Flor::Procedure

  name 'path'

  def pre_execute

    @node['started'] = false
    @node['path'] = []
  end

  def receive_non_att

    unless @node['started']
      payload['ret'] = [ payload['ret'] ]
      @node['started'] = true
    end

    super
  end

  def receive_last

    payload['pat'] = pat = @node['path']
    payload['ret'] = payload['ret'].first unless pat.any?(Array)

    super
  end
end

