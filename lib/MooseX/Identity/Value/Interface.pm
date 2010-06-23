
package MooseX::Identity::Value::Interface;
use Moose::Role;
use namespace::autoclean;

requires '_is_identical_value';

1;
__END__


=head1 NAME

MooseX::Identity::Value::Interface - Value interface for MooseX::Identity


=head1 DESCRIPTION

This is a L<Moose::Role> that requires your class to implement the
C<_is_identical_value> method.  See L<MooseX::Identity>.


