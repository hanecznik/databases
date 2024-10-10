package dao;
import java.util.List;
public interface IDAO<T> {

        void save(T t);

        T get(int id);

        List<T> getAll();
}
