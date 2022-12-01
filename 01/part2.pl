#!/usr/bin/perl
$i = 0;

while(<>)
{
  if (/^$/)
  {
    #print $tot[$i] . "\n";
    $i++;
    $cals = 0;
    $tot = 0;
  }
  
  if (/(\d+)/)
  {
    chomp;
    $cals = $_; 
    $tot[$i] = $tot[$i] + $cals;
  }
}

@sorted = reverse sort { $a <=> $b } @tot;
print $sorted[0] + $sorted[1] + $sorted[2];
