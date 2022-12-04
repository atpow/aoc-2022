#!/usr/bin/perl

$tot = 0;
$i = 0;

while(<>)
{
    
 #1-2,2-96
 if(/(\d+)\-(\d+),(\d+)\-(\d+)/)
 {
     $elf1a = $1;
     $elf1b = $2;
     $elf2a = $3;
     $elf2b = $4;
     
     @elf1sectors = &getrange($elf1a, $elf1b);
     @elf2sectors = &getrange($elf2a, $elf2b);


     print @elf1sectors;
     print "\n";
     print @elf2sectors;
     print "\n";
     
     $res1 = &checkrange(\@elf1sectors, \@elf2sectors);
     print "RES1:: $res1 \n";
     $res2 = &checkrange(\@elf2sectors, \@elf1sectors);

     print "RES2:: $res2 \n";

     print "\n=====\n";
     
     if ( $res1 || $res2)
     {
         $fullycontained++;
     }

 }
 
 
}

print "RESULT:: " . $fullycontained . "\n";

sub getrange
{
    @r = ();
    my ($a, $b) = @_;
    
    for ( $i = $a ; $i <= $b; $i++)
    {
        push(@r , $i);
    }
    return @r;
}


sub checkrange
{
    my $tot = 0;
    my ($e1, $e2) = @_;
    foreach $q (@$e1)
    {
        foreach $x (@$e2)
        {
            if ( $q eq $x )
            {
                $tot++;
            }
        }
    }   
    
    if ($tot > 0 )
    {
        return 1;
    }
    else
    {
        return 0;
    }
    
}
