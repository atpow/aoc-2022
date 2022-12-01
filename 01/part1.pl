#!/usr/bin/perl

$max = 0;

while(<>)
{
  if (/^$/)
  {
    if ( $tot > $max )
    {
      $max = $tot;
    }
    $cals = 0;
    $tot = 0;
  }
  
  if (/(\d+)/)
  {
    $cals = $_;
    $tot = $tot + $cals;
  }
}

print $max;
