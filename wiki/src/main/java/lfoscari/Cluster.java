package lfoscari;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.concurrent.atomic.AtomicIntegerArray;

import it.unimi.dsi.law.graph.LayeredLabelPropagation;
import it.unimi.dsi.webgraph.BVGraph;

/**
 * Using Layered Label Propagation compute the clusters of the graph.
 * Save the results in a serialized AtomicIntegerArray in ../graph/clustering.aia.
 * 
 */
public class Cluster {
	public static void main(String[] args) throws IOException {
		BVGraph graph = BVGraph.load("../graph/enwiki-2021");
		long seed = 420l;

		LayeredLabelPropagation llp = new LayeredLabelPropagation(graph, seed);

		System.out.println("Computing labels...");
		long startTime = System.nanoTime();

		/*
		* Is there a better choice than AtomicIntegerArray? A data
		* structure which can be compressed more efficiently.

		* Values of γ close to 0 highlight a coarse structure with few,
		* big and sparse clusters, while, as γ grows, the clusters are
		* small and dense, unveiling a fine-grained structure.
		*/
		AtomicIntegerArray labels = llp.computeLabels(0.5);
		
		System.out.println("Elapsed: " + (double) (System.nanoTime() - startTime) / 1_000_000_000.0);

		FileOutputStream fout = new FileOutputStream("../graph/clustering.aia");
  		ObjectOutputStream out = new ObjectOutputStream(fout);
  		out.writeObject(labels);
		out.close();
	}
}
