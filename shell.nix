with import <nixpkgs> {};

pkgs.mkShell {
	buildInputs = with pkgs; [ wget maven ];

	JAVA_ARGS = "-Xmx2G";

	BASENAME = "enwiki-2021";
	BASEURL = "http://data.law.di.unimi.it/webdata";

	shellHook = ''
		mkdir -p graph

		echo "Downloading graph and entities..."
		for ext in properties graph md5sums fcl; do
            echo -e '\t' graph/$BASENAME.$ext
		    wget -qc --output-document graph/$BASENAME.$ext $BASEURL/$BASENAME/$BASENAME.$ext
		done

        cd wiki
        echo "Setting classpath..."

        mvn -q dependency:build-classpath -Dmdep.outputFile=classpath.txt
        export CLASSPATH="`cat classpath.txt`:$CLASSPATH"

        cd ..

        if [ -f graph/$BASENAME.offsets ] && [ graph/$BASENAME.offsets -nt graph/$BASENAME.graph ]; then
          echo "Offsets already present... skipping"
        else
          echo "Computing offsets..."
          java it.unimi.dsi.webgraph.BVGraph -o -O -L graph/enwiki-2021
        fi
	'';
}
