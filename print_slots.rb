def print_slots
    line = []

    line[0] = '                              .-------.'
    line[1] = '                              |Jackpot|'
    line[2] = '                  ____________|_______|____________'
    line[3] = '                 |  __    __    ___  _____   __    |'
    line[4] = '                 | / _\  / /   /___\/__   \ / _\   |'
    line[5] = '                 | \ \  / /   //  //  / /\ \\ \  25|'
    line[6] = '                 | _\ \/ /___/ \_//  / /  \/_\ \ []|'
    line[7] = '                 | \__/\____/\___/   \/     \__/ []|'
    line[8] = '                 |===_______===_______===_______===|'
    line[9] = '                 ||*|\_     |*| _____ |*|\_     |*||'
    line[10] = '                 ||*|| \ _  |*||     ||*|| \ _  |*||'
    line[11] = '                 ||*| \_(_) |*||*BAR*||*| \_(_) |*||'
    line[12] = '                 ||*| (_)   |*||_____||*| (_)   |*|| __'
    line[13] = '                 ||*|_______|*|_______|*|_______|*||(__)'
    line[14] = '                 |===_______===_______===_______===| ||'
    line[15] = '                 ||*| _____ |*|\_     |*|  ___  |*|| ||'
    line[16] = '                 ||*||     ||*|| \ _  |*| |_  | |*|| ||'
    line[17] = '                 ||*||*BAR*||*| \_(_) |*|  / /  |*|| ||'
    line[18] = '                 ||*||_____||*| (_)   |*| /_/   |*|| ||'
    line[19] = '                 ||*|_______|*|_______|*|_______|*||_//'
    line[20] = '                 |===_______===_______===_______===|_/'
    line[21] = '                 ||*|  ___  |*|   |   |*| _____ |*||'
    line[22] = '                 ||*| |_  | |*|  / \  |*||     ||*||'
    line[23] = '                 ||*|  / /  |*| /_ _\ |*||*BAR*||*||'            
    line[24] = '                 ||*| /_/   |*|   O   |*||_____||*||'      
    line[25] = '                 ||*|_______|*|_______|*|_______|*||'
    line[26] = '                 |lc=___________________________===|'
    line[27] = '                 |  /___________________________\  |'
    line[28] = '                 |   |                         |   |'
    line[29] = '                _|    \_______________________/    |_'
    line[30] = '               (_____________________________________)'
    line[31] = ''
    line[32] = ''

    for i in 0..32
        puts line[i]
    end
end

def print_welcome

    lines = []

    lines[0] = "____    __    ____  _______  __        ______   ______    ___  ___   _______"
    lines[1] = "\\   \\  /  \\  /   / |   ____||  |      /      | /  __  \\  |   \\/   | |   ____|"
    lines[2] = " \\   \\/    \\/   /  |  |__   |  |     |  ,----'|  |  |  | |  \\  /  | |  |__   "
    lines[3] = "  \\            /   |   __|  |  |     |  |     |  |  |  | |  |\\/|  | |   __|  "
    lines[4] = "   \\    /\\    /    |  |____ |  `----.|  `----.|  `--'  | |  |  |  | |  |____ "
    lines[5] = "    \\__/  \\__/     |_______||_______| \\______| \\______/  |__|  |__| |_______|"

 
    for i in 0..5
        puts lines[i]
    end
end
