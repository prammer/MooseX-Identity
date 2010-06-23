
package MooseX::Identity::Class;

use Moose::Role;
#use Moose::Util 'find_meta';
use namespace::autoclean;

with 'MooseX::Identity::Class::Interface';

#my $does_id = sub {
#    my $meta = shift;
#    return Moose::Util::does_role( $meta->name,
#        'MooseX::Identity::Interface' );
#};

sub _is_identical_class {
    confess 'wrong number of arguments' if ( @_ != 2 );
    my ( $self, $other ) = @_;
    confess '_is_identical_class is not a class method' if !ref($self);

#    return if !ref($other);
#    return if !blessed($other);
#    return if !find_meta($other);
    return ( blessed($self) eq ( blessed($other) || '' ) );

#    my $other_meta = Moose::Util::find_meta($other) or return;
#    my $self_meta = $self->meta;
    #return ( $self_meta->name eq $other_meta->name );

    # below here may all just be overkill
    # but it's attractive from a "dog fooding" perspective

    # in some sense, ideally we'd just ask the classes if they are ===
    # like this:
    #return $self->meta->is_identical( $other->meta );
    # but we try to handle heterogeneous cases:
    #       $self->meta does not do MooseX::Identity::Interface
    #       $other cannot ->meta
    #       $other->meta does not do MooseX::Identity::Interface

#    return $self_meta->is_identical($other_meta)
#        if $self_meta->meta->can('does_role')
#            && $self_meta->meta->does_role('MooseX::Identity::Interface');
#        if $self_meta->$does_id;
#        if Moose::Util::does_role( $self_meta->name,
#            'MooseX::Identity::Interface' );

    # just return here because they are different classes?
#    return $other_meta->is_identical($self_meta)
#        if $other_meta->meta->can('does_role')
#            && $other_meta->meta->does_role('MooseX::Identity::Interface');
#        if $other_meta->$does_id;
#        if Moose::Util::does_role( $other_meta->name,
#            'MooseX::Identity::Interface' );

    # neither metaclasses do ===
#    return ( $self_meta->name eq $other_meta->name );
}

1;
__END__


=head1 NAME

MooseX::Identity::Class - Identical Class implementation


=head1 SYNOPSIS

  package MyClass;
  use Moose;
  with 'MooseX::Identity::Class';


=head1 DESCRIPTION

This role provides an implementation of C<_is_identical_class>.
See L<MooseX::Identity>.

=head1 METHODS

=over 4

=item B<_is_identical_class ($other)>

Returns true if this object is in the same class as C<$other>.

=back

