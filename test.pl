use strict;
use warnings;
use DB;

my $teng = DB->new(+{connect_info => ['dbi:SQLite:./profile','','']});

my @rows = $teng->search_by_sql("select user.id,food.name from user left join food on user.food_id = food.id",[],"food");

for my $row(@rows){
  warn $row->id;
  warn $row->name;
}

my @rows = $teng->search_by_sql("select user.id,food.name from user left join food on user.food_id = food.id",[],"food");

for my $row(@rows){
  warn $row->id;
  warn $row->name;
}
