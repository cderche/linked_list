Given(/^a list of (\d+) objects$/) do |arg1|
  expect { @head = Node.create }.to change(Node, :count).by(1)

  x = arg1.to_i - 1
  x.times do |i|
    expect { @tail = Node.create }.to change(Node, :count).by(1)
    expect { @head.add(@tail) }.to change(@head.siblings, :count).by(1)
    @tail.reload
  end
  @head.reload
end
