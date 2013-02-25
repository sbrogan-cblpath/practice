Given /^there is no person$/ do
end

When /^I create a new warrior$/ do
  @warrior = Person.new
end

Then /^I have something to dominate with$/ do
  @warrior.should_not be_nil
end

Given /^I am a large warrior$/ do
  @large_warrior = LargeWarrior.new
end

When /^I attempt to pick up a sword$/ do
  @large_warrior.pickup_sword
end

Then /^I am successful$/ do
  pending # express the regexp above with the code you wish you had
end
