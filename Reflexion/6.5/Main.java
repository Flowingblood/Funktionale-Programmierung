import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Stream;

public class Main {

    public static void main(String[] args) {


        allNaturalNumbersAsStream().forEach(n -> System.out.println(n));
    }

    public static Stream<Integer> allNaturalNumbersAsStream(){
        AtomicInteger i = new AtomicInteger(1);
        return Stream.generate(() -> i.getAndIncrement());
    }




}