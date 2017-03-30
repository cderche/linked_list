require 'linked_list/version'
require 'active_record' unless defined?(ActiveRecord)

module LinkedList
    class << self
        def included
            base.send :include, InstanceMethods

            base.has_one       :head, class_name: base.name, foreign_key: :head_id

            base.has_one       :previous, class_name: base.name, inverse_of: :next, foreign_key: :next_id
            base.belongs_to    :next, class_name: base.name, inverse_of: :previous, optional: true

            base.after_create  :set_head, unless: :head_exists?
        end
    end

    module InstanceMethods
        def add(object)
            false if object.next_id = self
            raise ActiveRecord::RecordNotSave, "[LinkedList] - Couldn't add element to tail" unless tail.update_attribute(:next_id, object.id)
            raise ActiveRecord::RecordNotSave, "[LinkedList] - Couldn't add head to element" unless object.update_attribute(:head_id, head_id)
            true
        end

        def siblings
            base.class.where(head_id: head_id)
        end

        def tail
            siblings.find_by(next: nil)
        end

        def next?
            !self.next.nil?
        end

        def previous?
            !previous.nil?
        end

        def first?
            self == head
        end

        def last?
            self == tail
        end

        private

        def set_head
            update(head_id: id)
        end

        def head_exists?
            !head.nil? || head_id?
        end
    end

    module ClassMethods
        def linked_list!
            include LinkedList
        end
    end
end

ActiveRecord::Base.extend LinkedList::ClassMethods
