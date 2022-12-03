#!/usr/bin/perl

$tot = 0;

while(<>)
{
    $line = $_;
    chomp $line;
    print $line . "\n";
    $bag1 = substr($line, 0, length($line)/2 );
    $bag2 = substr($line, length($line)/2, length($line));
    print $bag1 . "\n";
    print $bag2 . "\n";
    $d = &finddupes($bag1,$bag2);
    
    print "Dupe is $d \n";
    
    $pri = &priority($d);
    print "Priority is $pri \n===\n";
    
    $tot = $tot + $pri;
    

}

print "Total ::: $tot \n";


sub finddupes
{
    my ($a,$b) = @_;
    
    print("In sub -- $a  || $b \n");
    
    foreach $bag1char (split //, $a)
    {
        foreach $bag2char (split //, $b)
        {
            if ($bag1char eq $bag2char)
            {
                return($bag1char);
            }
        }
    }
}

sub priority
{
    my $c = @_[0];
    #97-122 lowercase
    #65-90 uppercase
    print "Scoring $c \n";
    if ( ord($c) >= 97 && ord($c) <= 122)
    {
        return ord($c) - 96;
    }

    if ( ord($c) >= 65 && ord($c) <= 90)
    {
        return ord($c) - 38;
    }    
    

}
