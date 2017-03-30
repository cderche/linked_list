Feature: Linked List Object

Scenario: Creating a linked list
  Given a list of 1 objects
  Then the list should have 1 objects
  And the head should be the current object
  And the tail should be the current object
  And the object should be first
  And the object should be last
  And the first object should not have a previous
  And the last object should not have a next

Scenario: Adding a object to a linked list
  Given a list of 1 objects
  When I add a new object
  Then the list should have 2 objects
  And the head should be the same of all objects
  And the tail should be the same of all objects
  And the head should be the first object
  And the tail should be the last object
  And the new object should be last

Scenario: Validating a linked list
  Given a list of 3 objects
  Then the list should have 3 objects
  And the head should be the first object
  And the tail should be the last object
  And object 1 should be next to object 0
  And object 0 should be previous to object 1
  And object 2 should be next to object 1
  And object 1 should be previous to object 2
  And the first object should not have a previous
  And the last object should not have a next

Scenario: Delete object if it is the tail
  Given a list of 3 objects
  When I try to delete object 2
  Then the list should have 2 objects

Scenario: Can't delete non-tail objects
  Given a list of 3 objects
  When I try to delete object 0
  And I try to delete object 1
  Then the list should have 3 objects
