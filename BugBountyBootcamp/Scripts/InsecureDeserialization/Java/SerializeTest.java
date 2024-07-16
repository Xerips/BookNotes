import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.Serializable;
import java.io.IOException;

class User implements Serializable{ // Define a class named User that implements Serializable.
  public String username; // Username attribute used to store the user's username.
}

public class SerializeTest{

  public static void main(String args[]) throws Exception{

    User newUser = new User(); // Creates a new User object.
    newUser.username = "hacker"; // Sets new User object's username to "hacker"

    FileOutputStream fos = new FileOutputStream("object.ser");
    ObjectOutputStream os = new ObjectOutputStream(fos);
    os.writeObject(newUser); // Writes the serialized version of newUser and stores it into the file object.ser.
    os.close();

    FileInputStream is = new FileInputStream("object.ser");
    ObjectInputStream ois = new ObjectInputStream(is);
    User storedUser = (User)ois.readObject(); // Reads the object from the file, deserializes it, and prints out the user's username.
    System.out.println(storedUser.username);
    ois.close();
  }
}
