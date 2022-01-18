import java.util.Arrays;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Stream;

public class Main2 {

    public static void main(String[] args) {

        List<String> list = Arrays.asList("a1", "a2", "c4", "c3", "d5");

        list
                .stream()
                .filter(string -> string.contains("c"))
                .sorted()
                .forEach(string -> System.out.println(string));

    }

}
