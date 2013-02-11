# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    new_movie = Movie.create(:title => movie[:title], :rating => movie[:rating], :release_date => movie[:release_date])
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end
Then /^(?:|I )should see all of the movies/ do
  page.all('table#movies tr').count.should == 11
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list = rating_list.gsub(/\s+/, "").split(/,/)
  rating_list.each do |rating|
    if uncheck then
      step "I uncheck \"ratings_#{rating}\""
    else
      step "I check \"ratings_#{rating}\""
    end
  end
end
