#!/usr/bin/perl -w

use v5.010;

use DBIx::SearchBuilder::Handle;
use Example::Model::Addresses;
use Example::Model::Employees;

my $handle = DBIx::SearchBuilder::Handle->new();
$handle->Connect( Driver => 'SQLite', Database => "mydatabase.sqlite" );
 
my $addr = Example::Model::Addresses->new( Handle => $handle );
my $empl = Example::Model::Employees->new( Handle => $handle );
 
#Create(Name => "Pavel", Phone => "+7985172332", EmployeeId => 1);
$addr->Limit( FIELD => "Phone", VALUE => "+7%", OPERATOR => "LIKE" );
while ( my $record = $addr->Next ) {
    say $record->Phone();
    say $record->Name();
    # if($record->Name() eq 'Test')
    # {
    #     # $record->SetPhone("+74952222224");
    #     $record->SetName("mobile");
    # }
    # if($record->Name() eq 'Pavel')
    # {
    #     # $record->SetPhone("+79955555332");
    #     $record->SetName("mobile");
    # }
}

# my $new_record = $addr->NewItem();
# $new_record->Create(Name => "Pavel", Phone => "+7985172332", EmployeeId => 1);
#my $new_empl = $empl->NewItem();
#$new_empl->Create(Dexterity => 10, Name  => "Pavel");
#$new_empl->Create(Dexterity => 9, Name  => "Pavel");
$empl->Limit(FIELD => "id", VALUE => 2);
my $empl_update = $empl->First;
$empl_update->SetDexterity(9);