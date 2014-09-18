## Usage

### Prepare database

sqlite3 profile
.read ./sql/ddl.sql
.read ./sql/insert.sql
.quit

## Execute 

perl -I. test.pl
