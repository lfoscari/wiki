package it.unimi.di.wiki;

import it.unimi.dsi.webgraph.BVGraph;

/**
 * Compute offsets
 *
 */
public class Offsets {
    public static void main(String[] args) throws Exception {
        BVGraph.main("-o -O -L ../graph/enwiki-2021".split(" "));
    }
}