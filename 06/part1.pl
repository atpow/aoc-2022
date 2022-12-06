#!/usr/bin/perl

$tot = 0;

while(<>)
{
    @array = split(//, $_);
    
    $pos = 0;
        
    foreach $c ( @array )
    {
        
        $logger[$pos]  = $c;
        
        #print "logger $pos =  $logger[$pos]  \n";
        if ( $pos >= 3)
        {
            print "Pattern is $logger[$pos-3] $logger[$pos-2] $logger[$pos-1] $logger[$pos] \n";
            $v = &checkforpattern($pos, $pos-3);
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
        print "CHECK $logger[$i] \n";
        ##add logger[$i] to an array
        push @temp , $logger[$i];
        
    }
    
    my %uniq; 
    @uniq{@temp} = ();  
    my $count = scalar keys %uniq;
    
    print @temp;
    print "\n";
    return $count;
 

}

#1271 too low
#1274 too low
