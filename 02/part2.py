import sys
import re
total_score = 0
score = { 'X' : 1 , 'Y' : 2, 'Z' : 3 ,
          'A' : 1 , 'B' : 2, 'C' : 3 }
for line in sys.stdin:
    round_score = 0
    x = re.findall("\w", line.rstrip())
    if (len(x) == 2):
        print(x[0] + " | " + x[1])
        
        them = x[0]
        us = x[1]
        
        if us == 'X':
            if them == 'A':  us = 'Z'
            if them == 'C':  us = 'Y'
        elif us == 'Y':
            if them == 'A':  us = 'X' 
            if them == 'C':  us = 'Z'
        elif us == 'Z':
            if them == 'A':  us = 'Y' 
            if them == 'C':  us = 'X' 
        round_score += score[us]
        #draw
        if (score[them] == score[us]):
            round_score = round_score + 3; 
        #we win
        if us == 'X' and them == 'C': round_score += 6  #rock blunts scisssors
        if us == 'Y' and them == 'A': round_score += 6  #paper wraps rock
        if us == 'Z' and them == 'B': round_score += 6  #scissors cuts paper
        total_score += round_score;
print ("Total :" + str(total_score))
