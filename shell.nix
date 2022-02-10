
with import <nixpkgs> {};

pkgs.mkShell {
	buildInputs = with pkgs; [ maven jdk11 ];

    JAVA_ARGS = "-Xmx2G";

    BASENAME = "enwiki-2021";
    BASEURL = "http://data.law.di.unimi.it/webdata";

	shellHook = ''
        cd graph
        echo "Downloading graph and entities"
        for ext in .properties .graph .md5sums .fcl; do
            wget -qc $BASEURL/$BASENAME/$BASENAME$ext
        done

        echo "Computing offsets"
        [ ! -f $BASENAME.offsets ] && java it.unimi.dsi.webgraph.BVGraph -o -O -L $BASENAME
        cd ..
	'';
}
