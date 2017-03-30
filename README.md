# LinkedList

[![Build Status](https://travis-ci.org/cderche/linked_list.svg?branch=master)](https://travis-ci.org/cderche/linked_list)

LinkedList is a gem with one objective, allow you to easily transform any model in to a linked list. We have a couple simple commands which will allow you to be up and running quickly. It is based on the [resort](https://github.com/codegram/resort) gem, but simplified. Unlike [resort](https://github.com/codegram/resort), LinkedList takes care of siblings by attaching all objects to a `head` object.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'linked_list', github: 'cderche/linked_list'
```

And then execute:

    $ bundle install

## Usage

First, run the migration for the model you want to turn into a Linked List (Product in our example).
```console
$ rails g linked_list:migration product
$ rails db:migrate
```
This will add the following fields to your model:
- previous_id
- next_id
- head_id

Then in the Product model:
```
class Product < ActiveRecord::Base
    linked_list!
end
```

## API

```ruby
@product1 = Product.create  # Create a product as usual
@product2 = Product.create

@product1.add(@product2)    # Adds @product2 to the @product1 linked list

@product2.head              # returns the head of the list (@product1)

@product1.tail              # returns the head of the list (@product2)

@product1.siblings          # returns all the products with the same head

@product1.next?             # checks if there is a next object (true)

@product1.next              # returns the next product (@product2)

@product2.previous?         # checks if there is a previous object (true)

@product2.previous          # returns the previous product (@product1)

@product1.first?            # returns true if the object is the first object

@product1.last?             # returns true if the object is the last object

# Destroying a object
@product1.destroy           # Throw abort if object is not the tail
```

## Testing

LinkedList uses cucumber-rails for testing. We create a object `Node` which extends our LinkedList and we run tests against it. To run the tests, execute:

    $ cucumber

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cderche/linked_list. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

