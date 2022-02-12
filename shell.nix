with import <nixpkgs> {};

pkgs.mkShell {
	buildInputs = with pkgs; [ maven jdk11 ];

	JAVA_ARGS = "-Xmx2G";

	BASENAME = "enwiki-2021";
	BASEURL = "http://data.law.di.unimi.it/webdata";

	shellHook = ''
		set -e

		mkdir -p graph

		echo "Downloading graph and entities"
		for ext in properties graph md5sums fcl; do
		    wget -c --output-document graph/$BASENAME.$ext $BASEURL/$BASENAME/$BASENAME.$ext
		done
	'';
}
