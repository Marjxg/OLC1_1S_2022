package estados;

import analizadores.Analizador_Lexico;
import analizadores.Analizador_sintactico;
import java.io.BufferedReader;
import java.io.FileReader;

/**
 *
 * @author moi
 */
public class Estados {

    public static void main(String[] args) {
        try {
            Analizador_Lexico lexico = new Analizador_Lexico(
                    new BufferedReader(new FileReader("./entrada.txt"))
            );
            Analizador_sintactico sintactico = new Analizador_sintactico(lexico);
            sintactico.parse();
            

        } catch (Exception e) {
        }
    }

}
