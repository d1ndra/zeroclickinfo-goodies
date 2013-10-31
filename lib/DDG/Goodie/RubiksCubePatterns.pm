package DDG::Goodie::RubiksCubePatterns;

use DDG::Goodie;

# Create interesting patterns from a solved Rubik's Cube.

primary_example_queries 'rcube stripes';
secondary_example_queries 'rcube cube in a cube', 'rcube swap centers';
description "create interesting patterns from a solved Rubik's Cube";
name 'Rubiks Cube';
code_url 'https://github.com/duckduckgo/zeroclickinfo-goodies/blob/master/lib/DDG/Goodie/RubiksCubePatterns.pm';
category 'random';
topics 'special_interest';

attribution web => ['robert.io', 'Robert Picard'], twitter => '__rlp', github => ['https://github.com/rpicard', 'rpicard'];

triggers start =>	"rcube", "rubik", "rubiks", "rubix", 
					"rubicks", "rubik's", "rubic's", "rubick's", 
					"rubik cube", "rubiks cube", "rubic cube", "rubics cube";

zci answer_type => "rubiks_cube";

handle remainder => sub {

	our %patterns = (
		"stripes" => "F U F R L2 B D' R D2 L D' B R2 L F U F",
		"crosses" => "U F B' L2 U2 L2 F' B U2 L2 U",
		"swap centers" => "U D' R L' F B' U D'",
		"checkerboard" => "F2 B2 R2 L2 U2 D2",
		"cube in a cube" => "F L F U' R U F2 L2 U' L' B D' B' L2 U",
		"cube in a cube in a cube" => "U' L' U' F' R2 B' R F U B2 U B' L U' F U R F'",	
		"exchanged peaks" => "F2 R2 D R2 U D F2 D' R' D' F L2 F' D R U'",
		"t's" => "F2 R2 U2 F' B D2 L2 F B",
		"anaconda" => "L U B' U' R L' B R' F B' D R D' F'",
		"python" => "F2 R' B' U R' L F' L F' B D' R B L2",
		"black mamba" => "R D L F' R L' D R' U D' B U' R' D'",	
	);

	sub render_text($) {
		my $name = pop;
		return "$name: $patterns{$name} \n";
	}
	
	sub render_html($) {
		my $name = pop;
		return "<p><i>$name</i>: $patterns{$name}</p>\n"
	}

	#support British English!
	s/centre/center/;
	
	#show answer
	return render_text($_), html => render_html($_) if ($patterns{$_});

	#display the cheatsheet
	my $output = my $html_output = "";
	foreach my $pattern (keys %patterns) {
		$output .= render_text($pattern);
		$html_output .= render_html($pattern);
	}
	return $output, html => $html_output;
};

1;
