package lfoscari;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import com.martiansoftware.jsap.JSAPException;

import it.unimi.dsi.webgraph.BVGraph;

/**
 * Compute offsets
 *
 */
public class Offsets {
	public static void main(String[] args) throws SecurityException, IllegalAccessException, InvocationTargetException, NoSuchMethodException, IOException, JSAPException, ClassNotFoundException, InstantiationException {
		BVGraph.main("-o -O -L ../graph/enwiki-2021".split(" "));
	}
}
