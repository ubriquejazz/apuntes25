import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

// Bingo usando listas

public class Main
{
    public static void main(String[] args) {
        generaCartonBingo(args[0]);
    }

    private static void generaCartonBingo(String fichero)
    {
        List<Integer> carton = new ArrayList<>();
        List<Integer> numeros90 = new ArrayList<>();
        Random r = new Random();
        int i, pos, n;

        for (i = 1; i <= 90; i++) {
            numeros90.add(i);
        }

//        Collections.shuffle(numeros90);
//        for(i=0;i<15;i++) {
//            carton.add(numeros90.get(i));
//        }

        for (i = 0; i < 15; i++) {
            pos = r.nextInt(numeros90.size());
            n = numeros90.get(pos);
            carton.add(n);
            numeros90.remove(pos);
        }
        Collections.sort(carton);

        try
        {
            FileOutputStream fos = new FileOutputStream(fichero);
            DataOutputStream dos = new DataOutputStream(fos);

            dos.writeUTF("BINGO");
            for (i = 0; i < 15; i++) {
                dos.writeInt(carton.get(i));
            }
            dos.close();
            fos.close();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
}
