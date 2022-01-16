import java.util.ArrayList;
import java.util.List;

public class Deque {

    private List<Object> data = new ArrayList<>();

    public Deque(Object... os){
        data.addAll(List.of(os));
    }

    public void addFirst(Object o){
        data.add(0, o);
    }

    public void addLast(Object o){
        data.add(o);
    }

    public void removeFirst(){
        data.remove(0);
    }

    public void removeLast(){
        data.remove(data.size()-1);
    }

    public Object getFirst(){
        return data.get(0);
    }

    public Object getLast(){
        return data.get(data.size()-1);
    }

}
