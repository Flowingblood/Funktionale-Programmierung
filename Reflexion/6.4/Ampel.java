public class Ampel {

    public Status state;

    public Ampel(Status initState){
        this.state = initState;
    }

    @Override
    public String toString() {
        return "Current State: " + state;
    }
}

enum Status{
    AUS,
    GRÜN,
    GELB,
    ROT,
    ROT_GELB,
}