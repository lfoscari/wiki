
with import <nixpkgs> {};

let ivy =
	stdenv.mkDerivation {
		name = "ivy";
		buildInputs = [ jdk11 ant ];

		src = fetchgit {
			url = "https://git-wip-us.apache.org/repos/asf/ant-ivy.git";
			sha256 = "sha256-BuF/73u493s2Su+jO2h5MNW1Xpq/HhL9lMiYa7cRewA=";
		};

		buildPhase = ''
			ant -S jar
		'';

		installPhase = ''
			mkdir $out
			cp -r build/artifact/* $out
		'';

	}; in

pkgs.mkShell {
	buildInputs = with pkgs; [ ivy jdk11 ant ];

	ANT_ARGS = "-lib ${ivy.outPath}";
    JAVA_ARGS = "-Xmx2G";

    BASENAME = "enwiki-2021";
    BASEURL = "http://data.law.di.unimi.it/webdata";

	shellHook = ''
        set -e

        echo "Compiling webgraph"
        cd webgraph
		ant -S ivy-setupjars jar
		source setcp.sh
        cd ..

        cd graph
        echo "Downloading graph"
        for ext in properties graph md5sums; do
            wget -qc $BASEURL/$BASENAME/$BASENAME.$ext
        done

        echo "Computing offsets"
        java it.unimi.dsi.webgraph.BVGraph -o -O -L $BASENAME
        cd ..
	'';
}
