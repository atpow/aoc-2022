#!/usr/bin/perl
$score{"X"} = 1;
$score{"Y"} = 2;
$score{"Z"} = 3;
$score{"A"} = 1;
$score{"B"} = 2;
$score{"C"} = 3;

while(<>)
{
  $round_score = 0;
  if(/(.)\ (.)/)
    {
        $them = $1;
        $us = $2;
        #score for the shape we selected
        $round_score += $score{$us};
        #draw
        if ($score{$them} eq $score{$us}) 
        {
            $round_score = $round_score + 3; 
        }
        #we win
        if ( ($us eq 'X') && ($them eq 'C') ) {  $round_score += 6; }  #rock blunts scisssors
        if ( ($us eq 'Y') && ($them eq 'A') ) {  $round_score += 6; }  #paper wraps rock
        if ( ($us eq 'Z') && ($them eq 'B') ) {  $round_score += 6; }  #scissors cuts paper
        $total_score += $round_score;
  }

}
print "Total :" . $total_score . "\n";
