 require './uno_client.rb'
 bob_uno = UnoClient.new 'bob'
 carol_uno = UnoClient.new 'carol'
 ted_uno = UnoClient.new 'ted'
 alice_uno = UnoClient.new 'alice'
 ralph_uno = UnoClient.new 'ralph'
 bob_uno.join_game
 carol_uno.join_game
 ted_uno.join_game
 alice_uno.join_game
 ralph_uno.join_game
 bob_uno.deal
 bob_uno.get_cards
 carol_uno.get_cards
 ted_uno.get_cards
 alice_uno.get_cards