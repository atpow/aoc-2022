#!/usr/bin/perl
$tot = 0;
while(<>)
{
    @array = split(//, $_);
    $pos = 0;
        
    foreach $c ( @array )
    {
        $logger[$pos]  = $c;
        if ( $pos >= 13)
        {
            $v = &checkforpattern($pos, $pos-13);
            print "UNIQ :: $v \n";
        }
        
        $pos++;
    }
}

sub checkforpattern  
{
    my ($b, $a) = @_;
    @temp = ();

    print( "\nChecking index " . $a . " - " . $b . "\n") ;
    for ( $i = $a ; $i <= $b ; $i ++)
    {
        push @temp , $logger[$i];
        
    }
    
    my %uniq; 
    @uniq{@temp} = ();  
    my $count = scalar keys %uniq;
    
    print @temp;
    print "\n";
    return $count;
}

