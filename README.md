# ACH Manager - Who doesn't want a local Federal Reserve Routing Directory?

## PROBLEM:

The Federal Reserve maintains a list of financial institutions
participating in the ACH network.  Write code which downloads
their list of institutions, parses out the information, and
stores it in a database.  The code only needs to support
downloading and storing all of the entries.  Bonus points
for using Ruby and writing tests.

[Download all entries here](http://www.fededirectory.frb.org/FedACHdir.txt)

[Format Specification here](http://www.fededirectory.frb.org/format_ACH.cfm)

## Solution

The solution creates a SQLite3 database and stores 'Institutions'. Repeated
execution of the loading script will update existing records.

In a nutshell, there is a simple 'DSL' for defining the fields as outlined on the
format specification (link above). A Retriever grabs the current file from the
server and breaks it into a list of raw institutions. Then, a parser runs through
each raw institution and throws it into the database after parsing it with the set
of field definitions outlined in the DSL.

That's about it...

## Executing the Solution:

You will need to have the 'activerecord' and 'sqlite3' gems installed
to run the solution.

**Note:** You can get the runtime and development dependencies installed via
bundler if you roll like that).

### Loading the database

#### Retrieving & loading the database with the current file from the FRB website

1. cd into the application directory
2. Execute

```
./bin/retrieve_ach_network
```


#### Retrieving & loading the database with a small local cache (only 2 records)

1. cd into the application directory
2. Execute:

```
LOCAL=true ./bin/retrieve_ach_network
```


### Looking at the results

You can go into a console session and run standard ActiveRecord operations
on the Institution model (Institution#first, #find_by_x, etc.).

Inside the application directory:

```
./bin/console
include ACHManager
# Institution.first, etc...
```

## Running the tests

You must have rspec installed to run the tests.

You can also use autotest if you have ZenTest installed (included in Gemfile).

If you're hardcore, you can just:

1. cd into the application directory
2. Execute:

```
rspec spec/**/*_spec.rb
```

