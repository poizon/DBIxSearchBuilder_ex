package Example::Model::Employee;
use strict;
use warnings;
use base qw/DBIx::SearchBuilder::Record/;

sub Table { "Employees" }

sub Schema {
    return {
      Name => { TYPE => 'varchar', },
      Dexterity => { TYPE => 'integer', },
    }
}

sub _Init {
  my $self   = shift;
  my $handle = shift;
  $self->_Handle($handle);

  return ($self);
}

1;