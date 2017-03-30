Then(/^the list should have (\d+) objects$/) do |arg1|
  expect(@head.siblings.count).to eq(arg1.to_i)
end

Then(/^the head should be the current object$/) do
  expect(@head.head).to eq(@head)
end

Then(/^the tail should be the current object$/) do
  @head.reload
  expect(@head.tail).to eq(@head)
end

Then(/^the object should be first$/) do
  expect(@head.first?).to be_truthy
end

Then(/^the head should be the same of all objects$/) do
  @head.siblings.each do |obj|
    expect(obj.head_id).to eq(@head.head_id)
  end
end

Then(/^the tail should be the same of all objects$/) do
  @head.siblings.each do |obj|
    expect(obj.tail).to eq(@head.tail)
  end
end

Then(/^the head should be the first object$/) do
  expect(@head.head.first?).to be_truthy
end

Then(/^the tail should be the last object$/) do
  expect(@head.tail.last?).to be_truthy
end

Then(/^the object should be last$/) do
  expect(@head.last?).to be_truthy
end

Then(/^the new object should be last$/) do
  expect(@tail.last?).to be_truthy
end

Then(/^object (\d+) should be next to object (\d+)$/) do |arg1, arg2|
  a = @head
  x = arg1.to_i
  x.times { a = a.next }

  b = @head
  y = arg2.to_i
  y.times { b = b.next }

  expect(a).to eq(b.next)
end

Then(/^object (\d+) should be previous to object (\d+)$/) do |arg1, arg2|
  a = @head
  x = arg1.to_i
  x.times { a = a.next }

  b = @head
  y = arg2.to_i
  y.times { b = b.next }

  expect(a).to eq(b.previous)
end

Then(/^the first object should not have a previous$/) do
  expect(@head.head.previous?).to be_falsy
end

Then(/^the last object should not have a next$/) do
  expect(@head.tail.next?).to be_falsy
end
