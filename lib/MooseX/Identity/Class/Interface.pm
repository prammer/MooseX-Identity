
package MooseX::Identity::Class::Interface;
use Moose::Role;
use namespace::autoclean;

requires '_is_identical_class';

1;
__END__


=head1 NAME

MooseX::Identity::Class::Interface - Class interface for MooseX::Identity


=head1 SYNOPSIS

Nothing here yet.


=head1 DESCRIPTION

This is a L<Moose::Role> that requires your class to implement the
_is_identical_class method.  See L<MooseX::Identity>.

