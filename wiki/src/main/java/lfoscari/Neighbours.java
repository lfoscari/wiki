package lfoscari;

import java.io.IOException;
import java.util.List;
import java.util.Scanner;

import it.unimi.dsi.fastutil.io.BinIO;
import it.unimi.dsi.webgraph.BVGraph;
import it.unimi.dsi.webgraph.LazyIntIterator;

/**
 * Get neighbours of node.
 *
 */
public class Neighbours 
{
    public static void main(String[] args) throws IOException, ClassNotFoundException
    {
        System.out.print("Pick a starting node: ");
        
        Scanner sc = new Scanner(System.in);
        int start = sc.nextInt();
        sc.close();
        
        List<? extends CharSequence> node2url = (List<? extends CharSequence>) BinIO.loadObject("../graph/enwiki-2021.fcl");
        
        BVGraph graph = BVGraph.load("../graph/enwiki-2021");
        System.out.println(start + " - " + node2url.get(start) + ":");
        
        int s;
        LazyIntIterator successors = graph.successors(start);
        while((s = successors.nextInt()) != -1) {
            System.out.println("\t" + s + " - " + node2url.get(s));
        }
    }
}
