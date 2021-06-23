package Example::Model::Addresses;
use base qw/DBIx::SearchBuilder/;
use Example::Model::Address;

sub _Init {
    my $self = shift;
    $self->Table('Addresses');
    return $self->SUPER::_Init(@_);
}
 
sub NewItem {
    my $self = shift;
    return(Example::Model::Address->new($self->_Handle));
}

1;