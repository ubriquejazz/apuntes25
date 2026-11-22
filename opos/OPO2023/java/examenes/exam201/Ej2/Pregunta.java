import java.util.List;

public class Pregunta {
    
    private String pregunta;
    private List<Respuesta> respuestas;

    public Pregunta(String pregunta, List<Respuesta> respuestas) {
        this.pregunta = pregunta;
        this.respuestas = respuestas;
    }

    public String getPregunta() {
        return pregunta;
    }

    public List<Respuesta> getRespuestas() {
        return respuestas;
    }

    public void mostrarPregunta(){
        System.out.println(pregunta);
        int i=0;
        while(i<respuestas.size()){
            System.out.println("\t" + (i+1) + ". " + respuestas.get(i));
            i++;
        }
    }
    
    public boolean comprobarRespuesta(int respuesta){
        Respuesta r = respuestas.get(respuesta - 1);
        if(r!=null){
            return r.isCorrecta();
        }
        return false;
    }
    
}
