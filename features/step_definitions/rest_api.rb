Given(/^I create a new card game with "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/) do |bob, carol, ted, alice|
  @players = Array.new
  @players.push bob
  @players.push carol
  @players.push ted
  @players.push alice
end

When(/^I welcome the players$/) do
  @players.each do |player|
    response = RestClient.post "http://#{ENV['SOURCE_URL']}:8082/join", :data => {name: player}.to_json, :accept => :json
    puts JSON.parse(response)['status']
    expect(JSON.parse(response)['status']).to eql("welcome #{player}")
  end
end

And(/^a player deals the cards$/) do
  response = RestClient.post "http://#{ENV['SOURCE_URL']}:8082/deal", :data =>{name: 'bob'}.to_json, :accept => :json
  #puts JSON.parse(response,:symbolize_names => true)
end

Then(/^I display the cards each player gets$/) do
  @players.each do |player|
    response = RestClient.get "http://#{ENV['SOURCE_URL']}:8082/cards", {:params => {:name => player}}
   # puts response
  end
end

And(/^"([^"]*)" joins the game$/) do |name|
  @players.push name
  @response = RestClient.post "http://#{ENV['SOURCE_URL']}:8082/join", :data => {name: name}.to_json, :accept => :json
  #puts JSON.parse(@response,:symbolize_names => true)
end

Then(/^"([^"]*)" should get an error message$/) do |name|
  expect(JSON.parse(@response)['status']).to eql("sorry #{name} - game not accepting new players")
end

Then(/^"([^"]*)" should get welcome message$/) do |name|
  expect(JSON.parse(@response)['status']).to eql("welcome #{name}")
end
