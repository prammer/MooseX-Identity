
package MooseX::Identity::Role;

use Scalar::Util 'refaddr';
use Moose::Role;
use namespace::autoclean;

with (
    'MooseX::Identity::Interface',
    'MooseX::Identity::Class',
    'MooseX::Identity::Value::Interface'
);

sub is_identical {
    confess 'wrong number of arguments' if ( @_ != 2 );
    my ( $self, $other ) = @_;
    confess 'is_identical is not a class method' if !ref($self);
    return 1 if ( ref($other) && ( refaddr($self) == refaddr($other) ) );
    return if !$self->_is_identical_class($other);
    return $self->_is_identical_value($other);
}

1;
__END__


=head1 NAME

MooseX::Identity::Role - Test identity of two objects/values


=head1 SYNOPSIS

  package MyClass;
  use Moose;
  with 'MooseX::Identity::Role';
  sub _is_identical_value { ... }


=head1 DESCRIPTION

In Perl 6 you will be able to test whether any two objects
are the same value by using C<===>.

The C<is_identical> method is to have the same meaning as C<===>.
This role provides an C<is_identical> method that is intended to
be usable for the majority of cases.

Your class will be required to implement a C<_is_identical_value>
method.

See also L<MooseX::WHICH> for a role that provides this.

Also see docs for L<MooseX::Identity>.

=head1 METHODS

=over 4

=item B<is_identical ($other)>

Returns true if this object is the same value as C<$other>.

=back


=head1 COMPOSED ROLES

L<MooseX::Identity::Interface>

L<MooseX::Identity::Class>

L<MooseX::Identity::Value::Interface>

Parts of the is_identical implemention is broken down into the above
roles.


