package examples;

import java.util.List;
import it.unimi.dsi.fastutil.io.BinIO;

public class NodeToEntity {
	public static void main(String[] args) {
		CharSequence url;
		List<? extends CharSequence> node2url = 
			(List<? extends CharSequence>) BinIO.loadObject("../enwiki-2021.fcl");
		url = node2url.get(7);

		System.out.println(url);
	}
}