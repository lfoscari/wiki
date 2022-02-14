with import <nixpkgs> {};

pkgs.mkShell {
	buildInputs = with pkgs; [ maven ];

	JAVA_ARGS = "-Xmx2G";

	BASENAME = "enwiki-2021";
	BASEURL = "http://data.law.di.unimi.it/webdata";

	shellHook = ''
		mkdir -p graph

		echo "Downloading graph and entities"
		for ext in properties graph md5sums fcl; do
		    wget -c --output-document graph/$BASENAME.$ext $BASEURL/$BASENAME/$BASENAME.$ext
		done

        if [ ! -f graph/$BASENAME.offsets ]; then
          echo "Computing offsets"
          java it.unimi.dsi.webgraph.BVGraph -o -O -L graph/$BASENAME
        fi

	'';
}
