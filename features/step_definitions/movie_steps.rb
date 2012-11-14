Given /^the following movies exist:$/ do |table|
    table.hashes.each do |movie|
        Movie.create(movie)
    end
    assert table.hashes.size == Movie.all.count
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |title, director|
    assert Movie.find_by_title(title).director == director
end
