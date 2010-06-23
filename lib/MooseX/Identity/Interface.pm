
package MooseX::Identity::Interface;
use Moose::Role;
use namespace::autoclean;

requires 'is_identical';

1;
__END__


=head1 NAME

MooseX::Identity::Interface - Interface for the identity method


=head1 SYNOPSIS

  package MyClass;
  use Moose;
  with 'MooseX::Identity::Interface';
  sub is_identical { ... }


=head1 DESCRIPTION

This L<Moose::Role> requires that you class implement the
C<is_identical> method and signals that this method has
the same meaning as the Perl 6 operator C<===>.

Your is_identical method should recieve one other argument in
addition to C<$self>.  It must return true if C<$self> is the same
value as the other argument.  This means the objects must be
the same type (in the same class).

See L<MooseX::Identity>.


