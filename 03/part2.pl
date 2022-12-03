#!/usr/bin/perl

$tot = 0;
$i = 0;

while(<>)
{
    chomp;
    if ( $i == 0) {$elf1 = $_; $i++; next;}
    if ( $i == 1) {$elf2 = $_; $i++; next;}
    if ( $i == 2) 
    {
        $elf3 = $_; 
        $i = 0; 
        print "got to 3\n";
        $d = &findbadge($elf1,$elf2, $elf3);
    }
    
    print "Dupe is $d \n";
    $pri = &priority($d);
    print "Priority is $pri \n===\n";
    $tot = $tot + $pri;
}

print "Total ::: $tot \n";

sub findbadge
{
    my ($a,$b,$c) = @_;
    
    print("In sub -- $a  || $b  || $c \n");
    
    foreach $bag1char (split //, $a)
    {
        foreach $bag2char (split //, $b)
        {
            foreach $bag3char (split //, $c)
            {
                if (($bag1char eq $bag2char) && ($bag1char eq $bag3char))
                {
                    return($bag1char);
                }
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
