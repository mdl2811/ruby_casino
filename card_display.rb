def card_display_ascii(card)

    lines = []
    rank = card.rank
    suit = card.suit

    case rank
        when '1'
            rank_val = 'A'
            space = ' '
        when '2', '3', '4', '5', '6', '7', '8', '9'
            rank_val = rank
            space = ' '
        when '10'
            rank_val = '10'
            space = ''
        when '11'
            rank_val = 'J'
            space = ' '
        when '12'
            rank_val = 'Q'
            space = ' '
        when '13'
            rank_val = 'K'
            space = ' '
    end

    case suit
        when "Clubs"
            suit_val = '♣'
        when "Hearts"
            suit_val = '♥'
        when "Spades"
            suit_val = '♠'
        when "Diamonds"
            suit_val = '♦'
    end

    lines[0] = "   ┌─────────┐"
    lines[1] = "   │ #{rank_val}#{space}      │"
    lines[2] = "   │         │"
    lines[3] = "   │    #{suit_val}    │"
    lines[4] = "   │         │"
    lines[5] = "   │      #{space}#{rank_val} │"
    lines[6] = "   └─────────┘"

    for i in 0..6
        puts lines[i]
    end
end

