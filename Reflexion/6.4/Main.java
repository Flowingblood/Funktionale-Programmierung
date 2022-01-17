public class Main {

    public static void main(String[] args) {
        AmpelSteuerung as = new AmpelSteuerung();

        while (true) as.changeState();
    }

}