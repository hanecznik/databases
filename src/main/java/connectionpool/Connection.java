package connectionpool;

public class Connection {

    private final String id;

    public Connection(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void close() {
        System.out.println("Connection " + id + " closed.");
    }
}
