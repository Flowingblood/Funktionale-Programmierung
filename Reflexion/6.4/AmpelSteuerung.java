public class AmpelSteuerung {

    private Ampel autoAmpel, fußgängerAmpel;

    private int currentState = 0;

    public AmpelSteuerung(){
        this.autoAmpel = new Ampel(Status.AUS);
        this.fußgängerAmpel = new Ampel(Status.AUS);
    }

    public void changeState(){
        switch (currentState) {
            case 0:
                autoAmpel.state = Status.GRÜN;
                fußgängerAmpel.state = Status.ROT;
                printAmpeln();
                currentState = 1;
                timeout(1);
                break;
            case 1:
                autoAmpel.state = Status.GELB;
                printAmpeln();
                currentState = 2;
                timeout(2);
                break;
            case 2:
                autoAmpel.state = Status.ROT;
                printAmpeln();
                currentState = 3;
                timeout(3);
                break;
            case 3:
                fußgängerAmpel.state = Status.GRÜN;
                printAmpeln();
                currentState = 4;
                timeout(4);
                break;
            case 4:
                fußgängerAmpel.state = Status.ROT;
                printAmpeln();
                currentState = 5;
                timeout(3);
                break;
            case 5:
                autoAmpel.state = Status.ROT_GELB;
                printAmpeln();
                currentState = 6;
                timeout(2);
                break;
            case 6:
                autoAmpel.state = Status.GRÜN;
                printAmpeln();
                currentState = 7;
                timeout(1);
                break;
            case 7:
                currentState = 1;
                timeout(10);
                break;
        }
    }

    private void timeout(long s){
        try {
            Thread.sleep(s*1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void printAmpeln(){
        System.out.println("AutoAmpel " + autoAmpel.toString());
        System.out.println("FußgängerAmpel " + fußgängerAmpel.toString());
    }
}