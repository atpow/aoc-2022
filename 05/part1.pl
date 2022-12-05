#!/usr/bin/perl
use Data::Dumper;

#            [C]         [N] [R]
#[J] [T]     [H]         [P] [L]
#[F] [S] [T] [B]         [M] [D]
#[C] [L] [J] [Z] [S]     [L] [B]
#[N] [Q] [G] [J] [J]     [F] [F] [R]
#[D] [V] [B] [L] [B] [Q] [D] [M] [T]
#[B] [Z] [Z] [T] [V] [S] [V] [S] [D]
#[W] [P] [P] [D] [G] [P] [B] [P] [V]
# 1   2   3   4   5   6   7   8   9 

$stacks{0} = ['W', 'B', 'D', 'N', 'C', 'F', 'J' ];
$stacks{1} = ['P', 'Z', 'V', 'Q', 'L', 'S', 'T' ];
$stacks{2} = ['P', 'Z', 'B', 'G', 'J', 'T' ];
$stacks{3} = ['D', 'T', 'L', 'J', 'Z', 'B', 'H' , 'C'];
$stacks{4} = ['G', 'V', 'B', 'J', 'S'  ];
$stacks{5} = ['P', 'S', 'Q' ];
$stacks{6} = ['B', 'V', 'D', 'F', 'L', 'M', 'P' , 'N'];
$stacks{7} = ['P', 'S', 'M', 'F', 'B', 'D', 'L' , 'R'];
$stacks{8} = ['V', 'D', 'T', 'R'];

while(<>)
{
 
  if ( /move (\d+) from (\d+) to (\d+)/ )
  {
      $num = $1;
      $src = $2;
      $dst = $3;
      print "Moving $num blocks from $src to $dst ... \n";
      
      for ($i = 0 ; $i < $num; $i++)
      {
          &movethem($src, $dst);
      }
  }
 
}

print Dumper(\%stacks{0});
print Dumper(\%stacks{1});
print Dumper(\%stacks{2});
print Dumper(\%stacks{3});
print Dumper(\%stacks{4});
print Dumper(\%stacks{5});
print Dumper(\%stacks{6});
print Dumper(\%stacks{7});
print Dumper(\%stacks{8});


sub movethem
{
    my ($a,$b) = @_;
    
    $a = $a - 1;
    $b = $b - 1;
    
    print("Moving from $a to $b \n");
    
    $q = pop(@{$stacks{$a}});
    print("Popped " . $q . " \n");
    push @{$stacks{$b}} , $q;
}
