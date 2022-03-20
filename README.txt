Playing around with Wikipedia speedrunning (https://wikispeedruns.com). The
project uses WebGraph (https://webgraph.di.unimi.it) and is based on Nix
(https://nixos.org). The wikipedia crawls were kindly provided by LAW
(https://law.di.unimi.it/webdata/enwiki-2021).

The goal is to experiment a preprocessing algorithm based on clustering too
speed up the search for a path in a very large graph given the starting and
ending nodes.

Upon cloning the repository download the graph data by running
`download-wiki.sh`.
