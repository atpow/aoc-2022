#!/usr/bin/perl
@path = ();

push @path, "/";

while(<>)
{
    
    if (/\$ cd (\w+)/)
    {
        $currentdir = $1;
        push @path, $currentdir;
        next;
    }
    
    if (/\$ cd \.\./)
    {
        pop @path;
        next;
    }
    
    if (/(\d+)/)
    {
        $v = $1;
        $s = @path;
        print "Found $v \n";
        my $y = '';
        
        if ($s > 1)
        {
            foreach $dir ( @path)
            {
                print "X $dir \n";
                $y = $y . "/" . $dir;
                $dirsize{$y} += $v;
                print "Y $y \n";
            }
        
        }   
    }
}

foreach $key (keys %dirsize)
{
  if ( $dirsize{$key} <= 100000 )
  {
        print "$dirsize{$key} | $key \n";
        $tot = $tot + $dirsize{$key};
  }
}

print "RESULT: $tot\n";
