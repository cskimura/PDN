package PDN::Transrator::Vendor::Supermicro;

use strict;
use warnings;
use Data::Dumper;

# http://www.supermicro.com.tw/products/Product_Naming_Convention/Naming_SYS_25.cfm
my $superserver25 = {
	'Form Factor' => {
		'Representation' => 'Form Factor',
		'Options' => {
			1 => '1U',
			2 => '2U',
			3 => '3U',
			4 => '4U',
		},
	},
	'Number of processor slots' => {
		'Representation' => 'Number of processor slots',
		'Options' => {
			1 => 'Single processor slot',
			2 => 'Dual processor slots',
			4 => 'Quad processor slots',
		},
	},
	'System Generation' => {
		'Representation' => 'System Generation',
		'Options' => {
			8 => 'X10 Series',
			7 => 'X9 Series',
			6 => 'X8 Series',
			5 => 'X7 Series',
		},
	},
	'Chipset' => {
		'Representation' => 'Chipset',
		'Options' => {
			A  => 'Atom/Workstation',
			B  => 'Bigby/Skt B2',
			C  => 'Cougar Point',
			D  => 'Denlow platform',
			G  => 'GPGPU',
			I  => 'Foxhollow',
			M  => 'Mukilteo',
			R  => 'Socket R',
			ST => 'Storage Server',
			T  => 'Tylersburg',
			TT => 'Twin',
			TR => 'Twin/Socket R',
			GT => 'GPU',
			RT => 'Socket R',
		},
	},
	'HDD Interface' => {
		'Representation' => 'HDD Interface',
		'Options' => {
			70 => 'LSI® 2008',
			71 => 'LSI® 2108',
			72 => 'LSI® 2208',
			73 => 'LSI® 2308',
			Q  => 'QDR',
			F  => 'FDR',
			3  => 'SAS',
			6  => 'SAS2',
			E  => 'Extension Slot with Riser',
			M  => 'Mini-Chassis',
			P  => 'Internal slot',
			NT => 'SATA without UIO',
			T  => 'SATA',
			U  => 'UIO',
			W  => 'WIO',
			N3 => 'SAS without UIO',
			D  => 'Dual Node Hot Swap',
			H  => 'Quad Node Hot Swap',
		},
	},
	'Power Redundancy' => {
		'Representation' => 'Power Redundancy',
		'Options' => {
			R => 'Redundant Power Supplies',
		},
	},
	'Additional' => {
		'Representation' => 'Additional',
		'Options' => {
			'+' => '18(X8)/24(X9) DIMM memory slots',
			F   => 'On board BMC (IPMI)',
			T   => '10 Gigabit Ethernet',
			4   => '4 Independent LAN ports',
			H   => '6 GPUs',
		},
	},
};

# http://www.supermicro.com.tw/products/Product_Naming_Convention/Naming_SYS_35.cfm
my $superserver35 = {
    'Number of processor slots' => {
		'Representation' => 'Number of processor slots',
		'Options' => {
			5 => 'Single processor slot',
			6 => 'Dual processor slots',
			7 => 'Dual processor slots (Tower)',
		},
	},
	'Reserved Digit' => {
		'Representation' => 'Reserved Digit',
		'Options' => {
		},
	},
	'Form Factor' => {
		'Representation' => 'Form Factor',
		'Options' => {
			1 => '1U',
			2 => '2U',
			3 => '3U',
			4 => '4U',
		},
	},
	'System Generation' => {
		'Representation' => 'System Generation',
		'Options' => {
			8 => 'X10 Series',
			7 => 'X9 Series',
			6 => 'X8 Series',
			5 => 'X7 Series',
		},
	},
	'Chipset' => {
		'Representation' => 'Chipset',
		'Options' => {
			A => 'Workstation',
			B => 'Bigby/Skt B2',
			C => 'Cougar Point',
			D => 'Denlow platform',
			G => 'GPGPU',
			I => 'Foxhollow',
			M => 'Mukilteo',
			P => 'Panther Point',
			R => 'Socket R',
			ST => 'Storage Server',
			T => 'Tylersburg',
			TR => 'Twin',
			GR => 'GPU',
			RR => 'Socket R',
			AX => 'Overclocking',
		},
	},
	'HDD Interface' => {
		'Representation' => 'HDD Interface',
		'Options' => {
			70 => 'LSI® 2008',
			71 => 'LSI® 2108',
			72 => 'LSI® 2208',
			73 => 'LSI® 2308',
			Q => 'QDR',
			F => 'FDR',
			3 => 'SAS',
			6 => 'SAS2',
			7 => 'SAS2 (LSI)',
			D => 'Desktop',
			L => 'Cost Optimized',
			E => 'Extension Slot with Riser',
			H => 'Hot Swap',
			M => 'Mini-Chassis',
			P => 'Internal slot / Passive',
			NT => 'SATA without UIO',
			T => 'SATA',
			U => 'UIO',
			W => 'WIO',
			N3 => 'SAS without UIO',
			D => 'Dual Node Hot Swap',
			H => 'Quad Node Hot Swap',
		},
	},
	'Power Redundancy' => {
		'Representation' => 'Power Redundancy',
		'Options' => {
			R => 'Redundant Power Supplies',
		},
	},
	'Additional' => {
		'Representation' => 'Additional',
		'Options' => {
			'+' => '18(X8)/24(X9) DIMM memory slots',
			F => 'On board BMC (IPMI)',
			T => '10 Gigabit Ethernet',
			4 => '4 Independent LAN ports',
		},
	},
};

# http://www.supermicro.com.tw/products/Product_Naming_Convention/Naming_AS_AMD.cfm
my $servers_amd = {
    'Form Factor' => {
        1 => '1U',
        2 => '2U',
        3 => '3U',
        4 => '4U / Tower or Mid-Tower',
    },
    'HD Tray Type' => {
        0 => '3.5Inch',
        1 => '2.5Inch',
    },
    'CPU' => {
        1 => 'Single CPU',
        2 => 'Dual CPU',
        4 => 'Quad CPU',
    },
    'Generation' => {
        0 => '1st Generation (Opteron 940)',
        1 => '2nd Generation (Socket F/AM2)',
        2 => '3rd Generation (Socket G34, C32, AM3+)',
    },
    'Server Platform' => {
        T => 'Twin Server',
        G => 'GPU',
        M => 'Microcloud',
    },
    'MB Platform' => {
        A => 'AMD Chipset (Socket F/AM2+/AM3+)',
        C => 'Socket C32 Board',
        G => 'Socket G34 Board',
        S => 'Serverworks Chipset',
        M => 'nVidia MCP55 Pro Chipset',
    },
    'Interface Type' => {
        2 => 'DDR2',
        3 => 'SAS',
        6 => 'SAS2',
        8 => 'SCSI',
        T => 'SATA',
        I => 'IDE',
        U => 'UIO',
        N => 'N:Neutral (2 std. PCI-E &SATA)',
        L => 'Cost-Effective Solution',
        H => 'Hot-plug',
        B => 'Twin hot-plug',
        D => 'Dual node twin hot-plug',
        M => 'Short depth',
        MR => 'Short depth <15Inch chassis rear (Rear I/O)',
        MF => 'Short depth <15Inch chassis rear (Front I/O)',
        IBQ => 'InfiniBand QDR (DDR)',
        70 => 'LSI 2008',
        71 => 'LSI 2108',
        72 => 'LSI 2208',
        73 => 'LSI 2308',
        12 => '12 Nodes',
    },
    'Additional' => {
        4 => 'Quad LAN',
        F => 'IPMI (Intelligent Platform Management Interface)',
        R => 'Redundant Power',
        '+' => 'Max Memory Support Enabled ( 12 or up per CPU Socket )',
        B => 'Black Chassis (only at last place)',
    },
};

# http://www.supermicro.com.tw/products/Product_Naming_Convention/Naming_MBD_Intel_DP.cfm
my $motherboards_intel_dp = {
    'CPU Type' => {
        X9 => '9th generation Xeon Processor E5 family ',
        X8 => '8th generation Xeon (QPI 6.4 GT/s)',
        X7 => '7th generation Xeon (1066/1333/1600 MHz FSB)',
        X6 => '6th generation Xeon (800MHz FSB)',
        C7 => 'Intel Core™ i7',
        C2 => 'Intel Core™ 2',
        PD => 'Intel Xeon® 3000 Series',
    },
    'Number of CPU Supported' => {
        D => 'Dual',
        S => 'Single',
        Q => 'Quad',
    },
    'CPU socket / Chipset / Board Type' => {
        A => 'Workstation ',
        B => 'Blackford (5000 series chipset)',
        B2 => 'Socket B2 (LGA 1356 socket)',
        C => 'San Clemente (5100 series chipset)',
        R => 'Socket R (LGA 2011 socket)',
        T => 'Tylersburg (5500/5520 series chipset) ',
        W => 'Seaburg (5400 series chipset)',
    },
    'Controller Support1' => {
        3 => 'SAS 3Gbps',
        6 => 'SAS2',
        7 => 'SAS2 6Gb (LSI)',
        8 => 'Dual Channel SCSI',
        A => 'ATX/E-ATX Form Factor',
        D => 'Data Center Optimized',
        i => 'SATA only',
        E => 'SATA only',
        G => 'GPU Optimized',
        H => 'Dual IOH chipsets onboard',
        L => 'Cost Optimized',
        M => 'Micro ATX',
        N => '3U and above UIO, UIO slot present on slot #0',
        P => 'Proprietary Form Factor',
        R => 'Riser',
        T => 'Twin Architecture',
        U => 'UIO Architecture',
        V => 'Alternative 3',
        W => '1U or 2U Form Factor',
        #WX9 => 'WIO Architecture',
        X => 'PCI or PCI-X',
        #XX9 => 'Additional I/O Slots or features',
        '+' => 'Extra DIMMs',
        #'+X9' => 'Extra DIMMs/Features',
    },
    'Controller Support1 X9 Extend' => {
        W => 'WIO Architecture',
        X => 'Additional I/O Slots or features',
        '+' => 'Extra DIMMs/Features',
    },
    'Controller Support2' => {
        3 => 'SAS 3Gbps',
        6 => 'SAS2 (6Gb)',
        7 => 'SAS2 6Gb (LSI)',
        8 => 'Dual Channel SCSI',
        '10G' => '10 Gigabit Nic',
        D => 'Dual GPU',
        F => 'Onboard IPMI w/ dedicated LAN',
        H => 'Hot-pluggable Twin',
        #HX9 => 'Hot-pluggable',
        i => 'SATA only',
        INF => 'Infiniband',
        IBX => 'Infiniband DDR',
        IBQ => 'Infiniband QDR',
        IBF => 'Infiniband FDR',
        JBOD => 'JBOD supported',
        J => 'JBOD supported',
        LN4 => 'Four LANs',
        L => 'Low Cost',
        N => '3U and above UIO',
        T => '10 Gb LAN SFP+',
        #TX9 => '10Gb LAN Base-T',
        TP => '10Gb LAN SFP+',
        Q => 'Quad GPU',
        'Q+' => 'Quad GPU',
        H => 'Quad/Six GPU',
        X => 'PCI or PCI-X',
    },
    'Controller Support2 X9 Extend' => {
        H => 'Hot-pluggable',
        T => '10Gb LAN Base-T',
    },
};

# http://www.supermicro.com.tw/products/Product_Naming_Convention/Naming_MBD_Intel_UP.cfm
my $motherboards_intel_up = {
    'CPU Type' => {
        X10 => '10th generation Xeon® (formerly codenamed Haswell)',
        X9 => '9th generation Xeon® (QPI 8.0 GT/s)',
        X8 => '8th generation Xeon® (QPI 6.4 GT/s)',
        X7 => '7th generation Xeon® (1066/1333/1600 MHz FSB)',
        X6 => '6th generation Xeon® (800MHz FSB)',
        A1 => 'Intel® Atom™',
        C7 => 'Intel® Core™ i7',
        C2 => 'Intel® Core™ 2',
        PD => 'Intel® Xeon® 3000 Series',
    },
    'Number of CPU Supported' => {
        D => 'Dual',
        S => 'Single',
        Q => 'Quad',
    },
    'Chipset / Board Type' => {
        A => 'Workstation',
        B => 'Patsburg with Socket B2',
        C => 'Cougar Point',
        E => 'Edisonville',
        L => 'Lynx Point',
        I => 'Ibex Peak (3420/3400)',
        R => 'Patsburg with Socket R',
        T => 'Tylersburg (X58)',
    },
    'Controller Support1' => {
        3 => 'SAS',
        6 => 'SAS2',
        8 => 'Dual Channel SCSI',
        A => 'Legacy / WS for Socket B2/R/H2/H3',
        D => 'MicroCloud Architecture',
        i => 'SATA only',
        E => 'Alternative 2',
        G => 'GPU Optimized',
        H => 'Alternative 1',
        L => 'Low Cost',
        M => 'uATX',
        P => 'Proprietary Form Factor',
        R => 'Riser',
        T => 'Twin Architecture',
        U => 'UIO Architecture',
        V => 'Alternative 3',
        W => 'WIO (example: X9SRW)',
        '+' => 'Extra DIMMs',

    },
    'Controller Support2' => {
        3 => 'SAS',
        4 => '4-pin 12V',
        6 => 'SAS2 (6Gb)',
        7 => 'LSI SAS 6Gbps',
        8 => 'Dual Channel SCSI',
        '10G' => '10 Gigabit Nic',
        D => 'Dual Nodes',
        Q => 'Quad Nodes',
        F => 'Onboard IPMI w/ dedicated LAN',
        i => 'SATA only',
        INF => 'Infiniband',
        LN4 => 'Four LANs',
        L => 'Low Cost',
        N => '3U and above UIO',
        S => 'Cost Optimized',
        T => 'Twin or 10Gb LAN',
        #T (for X8, X9) => '10Gb LAN',
        V => 'LVDS',
        X => 'PCIX',
    },
    'Controller Support2 X8 X9 Extend' => {
        T => '10Gb LAN',
    },
};

my $motherboards = {
    'CPU Type' => {
		'Representation' => 'CPU Type',
		'Options' => {
			X9 => '9th generation Xeon Processor E5 family',
			X8 => '8th generation Xeon (QPI 6.4 GT/s)',
			X7 => '7th generation Xeon (1066/1333/1600 MHz FSB)',
			X6 => '6th generation Xeon (800MHz FSB)',
			C7 => 'Intel Core™ i7',
			C2 => 'Intel Core™ 2',
			PD => 'Intel Xeon® 3000 Series',
		},
    },
    'Number of CPU Supported' => {
		'Representation' => 'Number of CPU Supported',
		'Options' => {
			D => 'Dual',
			S => 'Single',
			Q => 'Quad',
		},
    },
    'CPU socket / Chipset / Board Type' => {
		'Representation' => 'CPU socket / Chipset / Board Type',
		'Options' => {
			A => 'Workstation ',
			B => 'Blackford (5000 series chipset)',
			B2 => 'Socket B2 (LGA 1356 socket)',
			C => 'San Clemente (5100 series chipset)',
			R => 'Socket R (LGA 2011 socket)',
			T => 'Tylersburg (5500/5520 series chipset)',
			W => 'Seaburg (5400 series chipset)',
		},
    },
    'Controller Support1' => {
		'Representation' => 'Controller Support1',
		'Options' => {
			3 => 'SAS 3Gbps',
			6 => 'SAS2 (6Gb)',
			7 => 'SAS2 6Gb (LSI)',
			8 => 'Dual Channel SCSI',
			A => 'ATX/E-ATX Form Factor',
			D => 'Data Center Optimized',
			i => 'SATA only',
			E => 'SATA only',
			G => 'GPU Optimized',
			H => 'Dual IOH chipsets onboard',
			L => 'Cost Optimized',
			M => 'Micro ATX',
			N => '3U and above UIO, UIO slot present on slot #0',
			P => 'Proprietary Form Factor',
			R => 'Riser',
			T => 'Twin Architecture',
			U => 'UIO Architecture',
			V => 'Alternative 3',
			W => {
				'Key' => 'CPU Type',
				'Options' => {
					Default => '1U or 2U Form Factor',
					X9 => 'WIO Architecture',
				},
			},
			X => {
				'Key' => 'CPU Type',
				'Options' => {
					Default => 'PCI or PCI-X',
					X9 => 'Additional I/O Slots or features',
				},
			},
			'+' => {
				'Key' => 'CPU Type',
				'Options' => {
					Default => 'Extra DIMMs',
					'X9' => 'Extra DIMMs/Features',
				},
			},
		},
    },
    'Controller Support2' => {
		'Representation' => 'Controller Support2',
		'Options' => {
			3 => 'SAS 3Gbps',
			6 => 'SAS2 (6Gb)',
			7 => 'SAS2 6Gb (LSI)',
			8 => 'Dual Channel SCSI',
			'10G' => '10 Gigabit Nic',
			D => 'Dual GPU',
			F => 'Onboard IPMI w/ dedicated LAN',
			H => {
				'Key' => 'CPU Type',
				'Options' => {
					Default => 'Hot-pluggable Twin',
					X9 => 'Hot-pluggable',
				},
			},
			i => 'SATA only',
			INF => 'Infiniband',
			IBX => 'Infiniband DDR',
			IBQ => 'Infiniband QDR',
			IBF => 'Infiniband FDR',
			JBOD => 'JBOD supported',
			J => 'JBOD supported',
			LN4 => 'Four LANs',
			L => 'Low Cost',
			N => '3U and above UIO',
			T => {
				'Key' => 'CPU Type',
				'Options' => {
					Default => '10 Gb LAN SFP+',
					X9 => '10Gb LAN Base-T',
				},
			},
			TP => '10Gb LAN SFP+',
			Q => 'Quad GPU',
			'Q+' => 'Quad GPU',
			H => 'Quad/Six GPU',
			X => 'PCI or PCI-X',
		},
    },
};

# unofficial product naming conventions
# SYS-2027PR-HTTR
#     |||||  ||||
#     |||||  |||`- Power Redundancy
#     |||||  ||`-- Additional
#     |||||  |`--- HDD Interface
#     |||||  `---- Number of node
#     ||||`------- TwinPro  
#     |||`-------- System Generation
#     ||`--------- Number of processor slots
#     |`---------- Reserved Digit
#     `----------- Form Factor
my $superserver_twin = {
    'Form Factor' => {
        'Representation' => 'Form Factor',
        'Options' => {
            1 => '1U/2.5Inch HDD',
            2 => '2U/2.5Inch HDD',
            3 => '3U/2.5Inch HDD',
            4 => '4U/2.5Inch HDD',
            5 => '5U/3.5Inch HDD',
            6 => '6U/3.5Inch HDD',
            7 => '7U/3.5Inch HDD',
            8 => '8U/3.5Inch HDD',
        },
    },
    'Number of processor slots' => {
        'Representation' => 'Number of processor slots',
        'Options' => {
            1 => 'Single processor slot',
            2 => 'Dual processor slots',
            4 => 'Quad processor slots',
        },
    },
    'System Generation' => {
        'Representation' => 'System Generation',
        'Options' => {
            8 => 'X10 Series',
            7 => 'X9 Series',
            6 => 'X8 Series',
            5 => 'X7 Series',
        },
    },
    'Chipset' => {
        'Representation' => 'Chipset',
        'Options' => {
            PR => 'TwinPro/Socket R',
        },
    },
    'Number of Node' => {
        'Representation' => 'Number of Node',
        'Options' => {
            D  => 'Dual Node Hot Swap',
            H  => 'Quad Node Hot Swap',
        },
    },
    'HDD Interface' => {
        'Representation' => 'HDD Interface',
        'Options' => {
            C0 => 'SAS3 LSI 3008',
            C1 => 'SAS3 LSI 3108 + SuperCap',
            T  => 'SATA Intel C606',
        },
    },
    'Network Interface' => {
        'Representation' => 'Network Interface',
        'Options' => {
            T => '2 x 10GBase-T X540',
            F => '1 x FDR Mellanox X3',
            Q => '1 x QDR Mellanox X3',
        },
    },
    'Power Redundancy' => {
        'Representation' => 'Power Redundancy',
        'Options' => {
            R => 'Redundant Power Supplies',
        },
    },
};


my $template = {
    'Controller Support1' => {
		'Representation' => 'Controller Support1',
		'Options' => {
			V => 'Alternative 3',
			W => {
				'Key' => 'CPU Type',
				'Options' => {
					Default => '1U or 2U Form Factor',
					X9 => 'WIO Architecture',
				},
			},
		},
	},
};

sub new {
    my $class = shift;
    my %params = @_;

    my $self = {
        vendor        => 'Supermicro',
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

    my $spec = superserver25($prod) ||
               superserver35($prod) ||
               superserver_twin($prod) ||
               motherboards($prod) ||
               servers_amd($prod) ||
               motherboards_intel_up($prod) ||
			   undef;

    if (defined $spec) {
        $spec->{Vendor} = $self->{vendor};
        $spec->{'Product Name'} = $self->{'product_name'};
    }
    $self->{specification} = $spec;
}

# http://www.supermicro.com.tw/products/Product_Naming_Convention/Naming_AS_AMD.cfm
sub servers_amd {
    my $prod = shift;
    my %spec;

    #if ( $prod =~ m/^AS-(1|2|3|4)(0|1)(1|2|4)(0|1|2)(T|G|M)?(A|C|G|S|M)-(2|3|6|8|T|I|U|N|L|H|B|D|M|MR|MF|IBQ|70|71|72|73|12)(4|F|R|\+|B)+$/i ) {
    if ( $prod =~ m/^AS-(1|2|3|4)(0|1)(1|2|4)(0|1|2)(T|G|M)?(A|C|G|S|M)-(2|3|6|8|T|I|U|N|L|H|B|D|M|MR|MF|IBQ|70|71|72|73|12)(2|3|6|8|T|I|U|N|L|H|B|D|M|MR|MF|IBQ|70|71|72|73|12)((?:4|F|R|\+|B)+)/i ) {
        my ($form, $tray, $cpu, $gen, $platform, $mb, $if7, $if8, $additionals) = ($1, $2, $3, $4, $5, $6, $7, $8, $9);
        $spec{'Form Factor'} = $servers_amd->{'Form Factor'}->{$form};
        $spec{'HD Tray Type'} = $servers_amd->{'HD Tray Type'}->{$tray};
        $spec{'CPU'} = $servers_amd->{'CPU'}->{$cpu};
        $spec{'Generation'} = $servers_amd->{'Generation'}->{$gen};
        if (defined $platform) {
            $spec{'Server Platform'} = $servers_amd->{'Server Platform'}->{$platform};
        }
        $spec{'MB Platform'} = $servers_amd->{'MB Platform'}->{$mb};
        $spec{'Interface Type'} = $servers_amd->{'Interface Type'}->{$if7};
        $spec{'Interface Type'} .= ', '. $servers_amd->{'Interface Type'}->{$if8};
        if (defined $additionals) {
            my @additionals;
            while ( $additionals =~ m/4|F|R|\+|B/g ) {
                push(@additionals, $servers_amd->{'Additional'}->{$&});
            }
            $spec{'Additional'} = join(', ', @additionals);
        }
        return \%spec;
    }
    return undef;

}

# http://www.supermicro.com.tw/products/Product_Naming_Convention/Naming_MBD_Intel_DP.cfm
sub motherboards_intel_dp {
    my $prod = shift;
    my %spec;

    if ( $prod =~ m/^(X9|X8|X7|X6|C7|C2|PD)(D|S|Q)(A|B|B2|C|R|T|W)(3|6|7|8|A|D|i|E|G|H|L|M|N|P|R|T|U|V|W|X|\+)-(3|6|7|8|10G|D|F|HX8|HX9|i|INF|IBX|IBQ|IBF|JBOD|J|LN4|L|N|T|T|TP|Q|Q\+|H|X)$/ ) {
        my ($cpu, $cpus, $board, $ctrl1, $ctrl2) = ($1, $2, $3, $4, $5);

        $spec{'CPU Type'} = $motherboards_intel_dp->{'CPU Type'}->{$cpu};
        $spec{'Number of CPU Supported'} = $motherboards_intel_dp->{'Number of CPU Supported'}->{$cpus};
        $spec{'CPU socket / Chipset / Board Type'} = $motherboards_intel_dp->{'CPU socket / Chipset / Board Type'}->{$board};
        if ($cpu eq 'X9') {
            $spec{'Controller Support1'} = $motherboards_intel_dp->{'Controller Support1 X9 Extend'}->{$ctrl1} ||
                                           $motherboards_intel_dp->{'Controller Support1'}->{$ctrl1};
        } else {
            $spec{'Controller Support1'} = $motherboards_intel_dp->{'Controller Support1'}->{$ctrl1};
        }
        if ($cpu eq 'X9') {
            $spec{'Controller Support2'} = $motherboards_intel_dp->{'Controller Support2 X9 Extend'}->{$ctrl2} ||
                                           $motherboards_intel_dp->{'Controller Support2'}->{$ctrl2};
        } else {
            $spec{'Controller Support2'} = $motherboards_intel_dp->{'Controller Support2'}->{$ctrl2};
        }

        return \%spec;
    }

    return undef;
}

# http://www.supermicro.com.tw/products/Product_Naming_Convention/Naming_MBD_Intel_UP.cfm
sub motherboards_intel_up {
    my $prod = shift;
    my %spec;

    if ( $prod =~ m/^(X10|X9|X8|X7|X6|A1|C7|C2|PD)(D|S|Q)(A|B|C|E|L|I|R|T)(3|6|8|A|D|i|E|G|H|L|M|P|R|T|U|V|W|\+)-(3|4|6|7|8|10G|D|Q|F|i|INF|LN4|L|N|S|T|V|X)$/ ) {
        my ($cpu, $cpus, $chip, $ctrl1, $ctrl2) = ($1, $2, $3, $4, $5);

        $spec{'CPU Type'} = $motherboards_intel_up->{'CPU Type'}->{$cpu};
        $spec{'Number of CPU Supported'} = $motherboards_intel_up->{'Number of CPU Supported'}->{$cpus};
        $spec{'Chipset / Board Type'} = $motherboards_intel_up->{'Chipset / Board Type'}->{$chip};
        $spec{'Controller Support1'} = $motherboards_intel_up->{'Controller Support1'}->{$ctrl1};
        if ( $cpu eq 'X8' || $cpu eq 'X9' ) {
            $spec{'Controller Support2'} = $motherboards_intel_up->{'Controller Support2 X8 X9 Extend'}->{$ctrl2} ||
                                           $motherboards_intel_up->{'Controller Support2'}->{$ctrl2};
        } else {
            $spec{'Controller Support2'} = $motherboards_intel_up->{'Controller Support2'}->{$ctrl2};
        }
        return \%spec;
    }
    return undef;
}

# http://www.supermicro.com.tw/products/Product_Naming_Convention/Naming_SYS_25.cfm
sub superserver25 {
	my $prod = shift;
	my $spec = convention($prod,
		'SYS-', 'str',
		$superserver25->{'Form Factor'}, '1',
		'0', 'str',
		$superserver25->{'Number of processor slots'}, '1',
		$superserver25->{'System Generation'}, '1',
		$superserver25->{'Chipset'}, '1',
		'-', 'str',
		$superserver25->{'HDD Interface'}, '+',
		$superserver25->{'Power Redundancy'}, '?',
		$superserver25->{'Additional'}, '+',
	);

	return $spec;
}

# http://www.supermicro.com.tw/products/Product_Naming_Convention/Naming_SYS_35.cfm
sub superserver35 {
	my $prod = shift;
	my $spec = convention($prod,
		'SYS-', 'str',
		$superserver35->{'Number of processor slots'}, '1',
		'0', 'str',
		$superserver35->{'Form Factor'}, '1',
		$superserver35->{'System Generation'}, '1',
		$superserver35->{'Chipset'}, '1',
		'-', 'str',
		$superserver35->{'HDD Interface'}, '+',
		$superserver35->{'Power Redundancy'}, '?',
		$superserver35->{'Additional'}, '*',
	);

	return $spec;
}

sub motherboards {
	my $prod = shift;
	my $spec = convention($prod,
		$motherboards->{'CPU Type'}, '1',
		$motherboards->{'Number of CPU Supported'}, '1',
		$motherboards->{'CPU socket / Chipset / Board Type'}, '1',
		$motherboards->{'Controller Support1'}, '*',
		'-', 'str',
		$motherboards->{'Controller Support2'}, '*',
	);

	return $spec;
}

# unofficial product naming conventions
sub superserver_twin {
    my $prod = shift;
    my $spec = convention($prod,
        'SYS-', 'str',
        $superserver_twin->{'Form Factor'}, '1',
        '0', 'str',
        $superserver_twin->{'Number of processor slots'}, '1',
        $superserver_twin->{'System Generation'}, '1',
        $superserver_twin->{'Chipset'}, '1',
        '-', 'str',
        $superserver_twin->{'Number of Node'}, '1',
        $superserver_twin->{'HDD Interface'}, '1',
        $superserver_twin->{'Network Interface'}, '?',
        $superserver_twin->{'Power Redundancy'}, '1',
    );
    return $spec;
}

sub convention {
	my $prod = shift;
	my @conventions = @_;
	my %spec;

	my $regex;
	my @metas;
	my @words;
	my @opt_regexes;
	for (my $i = 0; $i < @conventions; $i++) {
		unless ( $i%2 ) {
			my $meta = $conventions[$i+1];
			if ( $meta eq 'str' ) {
				$regex .= $conventions[$i];
				next;
			}
			push @words, $conventions[$i];
			push @metas, $meta;
			# get options key list
			# print Dumper @conventions[$i];
			my $options = $conventions[$i]->{'Options'};
			my @opts;
			foreach (keys %$options) {
				s/\+/\\\+/g;
				push @opts, $_;
			}
			my $opt_regex = join('|', @opts);
			push @opt_regexes, $opt_regex;
			if ($meta eq '1') {
				$regex .= sprintf("(%s)", join('|', @opts));
				next;
			} elsif ($meta eq '*') {
				$regex .= sprintf("((?:%s)*)", join('|', @opts));
				next;
			} elsif ($meta eq '+') {
				$regex .= sprintf("((?:%s)+)", join('|', @opts));
				next;
			} elsif ($meta eq '?') {
				$regex .= sprintf("(%s)?", join('|', @opts));
				next;
			} else {
				die "Parse error";
			}
		}
	}

	my %cache;
	if ( my @matched = $prod =~ m/^$regex$/g ) {
		for (my $i = 0; $i<=$#matched; $i++) {
			my $sub_regex;
			unless ( defined $matched[$i] ) {
				next;
			};

			my $meta = $metas[$i];
			my $match_opt = 'g';
			my $match_prefix = '';
			my $match_suffix = '';
			if ( $meta eq '1' ) {
				$match_opt = '';
				$match_prefix = '^';
			    $match_suffix = '$';
			}

			if ( my @sub_matched = $matched[$i] =~ m/$match_prefix($opt_regexes[$i])$match_suffix/g ) {
				my $representation = $words[$i]->{'Representation'};
				my @notes;
				foreach (@sub_matched) {
					my $matched_str = $_;
					$cache{$representation} = $matched_str;
					my $note = $words[$i]->{'Options'}->{$matched_str};
					if ( ref($note) ne "HASH" ) {
						push @notes, $note;
					} else {
						my $key = $note->{'Key'};
						my $sub_key = $cache{$key};
						if ( ref($note->{'Options'}->{$sub_key}) ne "HASH" ) {
							push @notes, $note->{'Options'}->{$sub_key};
						} else {
							push @notes, $note->{'Options'}->{'Default'};
						}
					}

				}
				$spec{$representation} = join(' & ', @notes);
			}
		}
		return \%spec;
	} else {
		return undef;
	}
}

1;
# vim: ts=4 sw=4 expandtab
