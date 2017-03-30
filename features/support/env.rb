module Rails
  class << self
    def application
      :application
    end
  end
end

require 'linked_list'
require 'logger'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: ':memory:'
)

ActiveRecord::Schema.define do
  create_table :nodes do |t|
    t.integer     :previous_id
    t.integer     :next_id
    t.integer     :head_id
    t.timestamps  null: false
  end
end

class Node < ActiveRecord::Base
  linked_list!
end
