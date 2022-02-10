package lfoscari;

import java.io.IOException;
import java.util.List;
import it.unimi.dsi.fastutil.io.BinIO;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main(String[] args) throws IOException, ClassNotFoundException
    {
        List<? extends CharSequence> node2url =
            (List<? extends CharSequence>) BinIO.loadObject("../graph/enwiki-2021.fcl");
        CharSequence url = node2url.get(3);

        System.out.println(url);
    }
}
