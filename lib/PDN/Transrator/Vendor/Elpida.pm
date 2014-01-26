package PDN::Transrator::Vendor::Elpida;

use strict;
use warnings;
use Data::Dumper;

#
# EDJ4204EFBG-GN(L)-F
# |||| | |||  |  |  |
# |||| | |||  |  |  `- Environment Code
# |||| | |||  |  `---- Spec detail
# |||| | |||  `------- Speed
# |||| | ||`---------- Package
# |||| | |`----------- Die Rev.
# |||| | `------------ Power Supply, Interface
# ||||`--------------- Organization
# |||`---------------- Density/Bank
# ||`----------------- Product Family
# |`------------------ Type
# `------------------- Elpida Memory
#

my $ddr = {
    'Vendor' => {
        'E' => ' Elpida Memory',
    },

    'Type' => {
        'B' => 'Module',
        'C' => 'Bare Chip',
        'D' => 'Package Device',
    },

    'Product Family' => {
        'J' => 'DDR3',
        'E' => 'DDR2',
        'M' => 'DDR Mobile RAM / Mobile RAM',
        'W' => 'GDDR5',
        'X' => 'XDR',
        'B' => 'DDR2 Mobile RAM',
    },

    'Density/Bank' => {
        '42' => '4Gb / 8-bank',
        '21' => '2Gb / 8-bank',
        '11' => '1Gb / 8-bank',
        '20' => '2Gb / 16-bank',
        '40' => '4Gb / 16-bank',
        '10' => '1Gb',
    },

    'Density Bit' => {
        '42' => '4Gb',
        '21' => '2Gb',
        '11' => '1Gb',
        '20' => '2Gb',
        '40' => '4Gb',
        '10' => '1Gb',
        '44' => '4Gb',
        '24' => '2Gb',
        '13' => '1Gb',
        '22' => '2Gb',
        '10' => '1Gb',
    },

    'Bank' => {
        '42' => '8',
        '21' => '8',
        '11' => '8',
        '20' => '16',
        '40' => '16',
    },

    'Density/Rank' => {
        '81' => '8GB / 2-rank',
        '40' => '4GB / 1-rank',
    },

    'Density Byte' => {
        '81' => '8GB',
        '40' => '4GB',
    },

    'Rank'=> {
        '81' => '2',
        '40' => '1',
    },

    'Density/Page Size' => {
        '44' => '4Gb / 4KB',
        '24' => '2Gb / 2KB',
        '13' => '1Gb / 2KB',
        '22' => '2Gb / 4KB',
        '10' => '1Gb / 2KB, 4KB',
    },

    'Page Size' => {
        '44' => '4KB',
        '24' => '2KB',
        '13' => '2KB',
        '22' => '4KB',
        '10' => '2KB, 4KB',
    },

    'Module Type' => {
        'U' => 'Unbuffered(Non-ECC)',
    },

    'DRAM Density' => {
        'G' => '4Gb',
    },

    'Organization' => {
        '04' => 'x4',
        '08' => 'x8',
        '16' => 'x16',
        '32' => 'x32',
        '0A' => 'x16/x32 Optioanl',
    },

    'DRAM Organization' => {
        '8' => 'x8',
    },

    'Power Supply, Interface' => {
        'B' => '1.5V, SSTL_15',
        'D' => '1.5V, SSTL_15',
        'E' => '1.35V',
        'A' => '1.8V, SSTL_18',
        'C' => 'VDD=1.8V, VDDQ=1.8V, LVCMOS',
    },

    'GDDR5 Power Supply' => {
        'B' => '1.5V',
    },

    'XDR Power Supply' => {
        'B' => '1.5V VDD, 1.2V VTERM',
    },

    'DDR2 Power Supply' => {
        'B'=> 'VDD1 = 1.8V, VDD2 = VDDCA = VDDQ = 1.2V, S4B device, HSUL',
    },

    'Power Supply' => {
        'B' => '1.5V',
        'D' => '1.5V',
        'E' => '1.35V',
        'A' => '1.8V',
        'C' => 'VDD=1.8V, VDDQ=1.8V',
    },

    'Interface' => {
        'B' => 'SSTL_15',
        'D' => 'SSTL_15',
        'E' => '',
        'A' => 'SSTL_18',
        'C' => 'LVCMOS',
    },

    'Die Rev.' => {
    },

    'Module Outline' => {
        'U' => '204-pin SO-DIMM',
    },

    'Module Rev' => {
        '0' => 'without thermal sensor',
    },

    'Package' => {
        'BG' => 'FBGA',
        'CN' => 'Bare Chip',
        'SE' => 'FBGA',
    },

    'Speed CL' => {
        'JS' => 'DDR3-1866M (13-13-13)',
        'GN' => 'DDR3-1600K (11-11-11)',
        'DJ' => 'DDR3-1333H (9-9-9)',
        '1J' => 'DDR2-1066 (7-7-7)',
        '8E' => 'DDR2-800 (5-5-5)',
        '70' => '7.0Gbps',
        '7A' => '7.0Gbps',
        '60' => '6.0Gbps',
        '6A' => '6.0Gbps',
        '50' => '5.0Gbps',
        '4D' => '4.0G (tRAC=34, D Bin)',
        '3C' => '3.2G (tRAC=35, C Bin)',
    },

    'Speed' => {
        'JS' => 'DDR3-1866',
        'GN' => 'DDR3-1600',
        'DJ' => 'DDR3-1333',
        '1J' => 'DDR2-1066',
        '8E' => 'DDR2-800',
        '70' => '7.0Gbps',
        '7A' => '7.0Gbps',
        '60' => '6.0Gbps',
        '6A' => '6.0Gbps',
        '50' => '5.0Gbps',
        '4D' => '4.0G (tRAC=34, D Bin)',
        '3C' => '3.2G (tRAC=35, C Bin)',
    },

    'CL' => {
        'JS' => '13',
        'GN' => '11',
        'DJ' => '9',
        '1J' => '7',
        '8E' => '5',
    },

    'Speed DDR Mobile' => {
        '50' => '400Mbps',
    },

    'Module Speed CL' => {
        'GN' => 'PC3-12800 (11-11-11)',
        'DJ' => 'PC3-10660 (9-9-9)',
    },

    'Module Speed' => {
        'GN' => 'PC3-12800',
        'DJ' => 'PC3-10660',
    },

    'Spec Detail' => {
        'L' => 'Reduced Self-Refresh',
    },

    'Environment Code' => {
        'F' => 'Lead Free (RoHS compliant) and Halogen Free',
    },

    'Wafer' => {
        'Y3' => '300nm Wafer',
    },

};

sub new {
    my $class = shift;
    my %params = @_;

    my $self = {
        vendor        => 'Elpida',
        product_name  => $params{product_name} || undef,
        specification => undef,
    };
    bless $self, $class;

    $self->grok_specification();

    return $self;
}

sub specification {
    my $self = shift;
    return $self->{specification};
}

sub grok_specification {
    my $self = shift;
    my $prod = $self->{product_name};

    my $spec = ddr($prod) ||
    undef;

    if (defined $spec) {
        $spec->{Vendor} = $self->{vendor};
        $spec->{'Product Name'} = $self->{'product_name'};
    }
    $self->{specification} = $spec;
}

sub ddr {
    my $product = shift;
    my %spec;

    if ( $product =~ m/^(E)(D)(J|E|W|X)(42|21|11|20|40|10)(04|08|16|32)(B|D|E|A)(.)(BG|SE)-(JS|GN|DJ|1J|8E|7A|70|6A|60|50|4D|3C)(L|A2)?-(F)$/ ) {
        # DDR3 or DDR2
        my ($vendor, $type, $family, $densitybank, $organization, $psi, $rev, $package, $speedcl, $detail, $environment) = ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);
        my ($density, $bank, $power, $interface, $speed, $cl);

        $spec{'Vendor'}         = $ddr->{'Vendor'}{$vendor};
        $spec{'Type'}           = $ddr->{'Type'}{$type};
        $spec{'Product Family'} = $ddr->{'Product Family'}{$family};
        $spec{'Density'}        = $ddr->{'Density Bit'}{$densitybank};
        $spec{'Bank'}           = $ddr->{'Bank'}{$densitybank} unless ( $spec{'Product Family'} eq 'XDR' );
        $spec{'Organization'}   = $ddr->{'Organization'}{$organization};
        if ( $spec{'Product Family'} eq 'GDDR5' ) {
            $spec{'Power Supply'}   = $ddr->{'Power Supply'}{$psi};
        } elsif ( $spec{'Product Family'} eq 'XDR' ) {
            $spec{'Power Supply'}   = $ddr->{'XDR Power Supply'}{$psi};
        } else {
            $spec{'Power Supply'}   = $ddr->{'Power Supply'}{$psi};
            $spec{'Interface'}      = $ddr->{'Interface'}{$psi};
        }
        $spec{'Package'}        = $ddr->{'Package'}{$package};
        $spec{'Speed'}          = $ddr->{'Speed'}{$speedcl};
        $spec{'CL'}             = $ddr->{'CL'}{$speedcl} if (defined $ddr->{'CL'}{$speedcl}); 
        $spec{'Spec Detail'}    = $ddr->{'Spec Detail'}{$detail} if (defined $detail);
        $spec{'RoHS'}           = $ddr->{'Environment Code'}{$environment};
        
        return \%spec;
    } elsif ( $product =~ m/^(E)(B)(J)(81|40)(U)(G)(8)(E)(.)(U)(0)-(GN|DJ)-(F)$/ ) {
        # DDR3 Module
        my ($vendor, $type, $family, $densityrank, $moduletype, $dramdensity, $organization, $power, $die, $outline, $rev, $speedcl, $environment) = ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13);
        $spec{'Vendor'}         = $ddr->{'Vendor'}{$vendor};
        $spec{'Type'}           = $ddr->{'Type'}{$type};
        $spec{'Product Family'} = $ddr->{'Product Family'}{$family};
        $spec{'Density'}        = $ddr->{'Density Byte'}{$densityrank};
        $spec{'Rank'}           = $ddr->{'Rank'}{$densityrank};
        $spec{'ECC'}            = $ddr->{'Modyle Type'}{$moduletype};
        $spec{'DRAM Density'}   = $ddr->{'DRAM Density'}{$dramdensity};
        $spec{'Power Supply'}   = $ddr->{'Power Supply'}{$power};
        $spec{'Die Rev'}        = $die;
        $spec{'Module Outline'} = $ddr->{'Module Outline'}{$outline};
        $spec{'Module Rev'}     = $ddr->{'Module Rev'}{$rev};
        $spec{'Speed'}          = $ddr->{'Module Speed'}{$speedcl};
        $spec{'CL'}             = $ddr->{'CL'}{$speedcl};
        $spec{'RoHS'}           = $ddr->{'Environment Code'}{$environment};

        return \%spec;
    } elsif ( $product =~ m/^(E)(C)(B|M)(44|24|13|22|10)(0A)(B|C)(.)(CN)-?(50)?-(Y3)$/ ) {
        # DDR2 Mobile, DDR Mobile
        my ($vendor, $type, $family, $density, $organization, $power, $die, $package, $speed, $wafer) = ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10);
        $spec{'Vendor'}         = $ddr->{'Vendor'}{$vendor};
        $spec{'Type'}           = $ddr->{'Type'}{$type};
        $spec{'Family'}         = $ddr->{'Product Family'}{$family};
        $spec{'Density'}        = $ddr->{'Density Bit'}{$density};
        $spec{'Page Size'}      = $ddr->{'Page Size'}{$density};
        $spec{'Organization'}   = $ddr->{'Organization'}{$organization};
        $spec{'Power Supply'}   = $ddr->{'DDR2 Power Supply'}{$power};
        $spec{'Die Rev'}        = $die;
        $spec{'Package'}        = $ddr->{'Package'}{$package};
        $spec{'Wafer'}          = $ddr->{'Wafer'}{$wafer};
        $spec{'Speed'}          = $ddr->{'Speed DDR Mobile'}{$speed} if (defined $speed);

        return \%spec;
    }
    return undef;
}

1;
# vim: ts=4:sw=4:expandtab
