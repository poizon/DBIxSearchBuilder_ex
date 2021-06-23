package Example::Model::Employees;
use base qw/DBIx::SearchBuilder/;
use Example::Model::Employee;

sub _Init {
    my $self = shift;
    $self->Table('Employees');
    return $self->SUPER::_Init(@_);
}
 
sub NewItem {
    my $self = shift;
    return(Example::Model::Employee->new($self->_Handle));
}

1;