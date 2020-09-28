
module Flor

  class Message < Sequel::Model(:flor_messages)
    include FlorModelMethods

    set_primary_key :id

    #create_table :flor_messages do
    #
    #  primary_key :id, type: :Integer
    #  String :domain, null: false
    #  String :exid, null: false
    #  String :point, null: false # 'execute', 'task', 'receive', ...
    #  File :content # JSON
    #  String :status, null: false
    #  String :ctime, null: false
    #  String :mtime, null: false
    #  String :cunit
    #  String :munit
    #
    #  index :exid
    #end
  end
end
