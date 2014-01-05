package PDN::Transrator::Vendor;

use strict;
use warnings;

my %grok_vendor = (
    'SYS-' => 'Supermicro', # SuperServer with 2.5" or 3.5" HDDs
);

sub new {
    my $class = shift;
    my %params = @_;

    my $self = {
        vendor        => $params{vendor} || undef,
        product_name  => $params{product_name},
        specification => undef,
    };
    bless $self, $class;

    $self->grok_vendor();
    $self->specification();

    return $self;
}

sub grok_vendor {
    my $self = shift;

    if  ( defined $self->{vendor} ) {
        return 1;
    }

    foreach my $pattern (keys %grok_vendor) {
        if ( $self->{product_name} =~ m/^$pattern/ ) {
            $self->{vendor} = $grok_vendor{$pattern};

            return 1;
        }
    }

    $self->{product_name} = 'unknown';

    return 0;
}

sub specification {
    my $self = shift;

    my $module_file = "PDN/Transrator/Vendor/$self->{vendor}.pm";
    eval { require $module_file; };
    if ($@) {
        print "Could not load a module file: $module_file";
        return;
    }

    my $vendor = "PDN::Transrator::Vendor::$self->{vendor}"->new('product_name'=>$self->{product_name});
    $self->{specification} = $vendor->specification();

}

1;
# vim: ts=4 sw=4 expandtab
