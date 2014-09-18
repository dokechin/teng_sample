use strict;
use warnings;
use DB;
use DBJ;

# This sample is bad case. Joined result inflate is not called.
my $teng = DB->new(+{connect_info => ['dbi:SQLite:./profile','','']});

my @rows = $teng->search_by_sql("select user.id,food.name from user left join food on user.food_id = food.id",[]);

for my $row(@rows){
  warn $row->id;
  warn $row->name;
}

# This sample is bad case. Joined result inflate is not called.

my $ite = DB->new(+{connect_info => ['dbi:SQLite:./profile','','']});

my $ite = $teng->search_by_sql("select * from user left join food on user.food_id = food.id",[]);

while (my ($joined) = $ite->next) {
  warn $joined->id;
  warn $joined->name;
}


# This sample is good case. Joined table "food" inflate is called.
my $tengj = DBJ->new(+{connect_info => ['dbi:SQLite:./profile','','']});

$ite = $tengj->search_joined(user => [
               food => {'user.food_id' => 'food.id'},
           ]);

while (my ($user, $food) = $ite->next) {
  warn $user->id;
  warn $food->name;
}


