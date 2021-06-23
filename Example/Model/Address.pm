package Example::Model::Address;
use strict;
use warnings;
use base qw/DBIx::SearchBuilder::Record/;

use Data::Dumper;
use DDP;
# Class and instance method
sub Table { "Addresses" }
# Class and instance method

sub Schema {
    return {
        Name => { TYPE => 'varchar', },
        Phone => { TYPE => 'varchar', },
        EmployeeId => { REFERENCES => 'Example::Model::Employee', },
    }
}

sub _Init {
  my $self   = shift;
  my $handle = shift;
  $self->_Handle($handle);

  return ($self);
}

=head2 ValidatePhone()

May validate input data and add errors, if need

=cut
sub ValidatePhone
{
  my $this = shift;
  my $phone_number = shift;
  # some check here
  if ( $phone_number !~ /^\+7(\d{10})/ ) {
    print Dumper $phone_number;
    return 0;
  }

  return 1;
}

1;