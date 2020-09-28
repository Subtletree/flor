
module Flor

  class Trace < Sequel::Model(:flor_traces)
    include FlorModelMethods

    set_primary_key :id

    #create_table :flor_traces do
    #
    #  primary_key :id, type: :Integer
    #  String :domain, null: false
    #  String :exid, null: false
    #  String :nid, null: true
    #  String :tracer, null: false # 'executor', 'trace'
    #  String :text, null: false # 'blah blah blah'
    #  String :ctime, null: false
    #  String :cunit
    #
    #  index :exid
    #end
  end
end
