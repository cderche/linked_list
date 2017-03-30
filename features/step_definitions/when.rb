When(/^I add a new object$/) do
  expect { @tail = Node.create }.to change(Node, :count).by(1)
  expect { @head.add(@tail) }.to change(@head.reload.siblings, :count).by(1)
  @head.reload
  @tail.reload
end

When(/^I try to delete object (\d+)$/) do |arg1|
  a = @head
  x = arg1.to_i
  x.times { a = a.next }

  a.destroy
end
