/**
 * Trabajo Práctico Nº 2 - Tecnología XML
 * Asignatura: Laboratorio de Programación
 * Carrera: Analista de Sistemas / Licenciatura en Sistemas
 * Universidad Nacional de la Patagonia Austral
 * 
 * Ejercicio 6: Generar un informe con los promedios de alumnos a partir del XML 
 *              de calificaciones del ejercicio 5. El programa muestra por consola 
 *              el promedio de cada alumno, el promedio general, y genera un 
 *              nuevo documento XML con esta información.
 * 
  * Archivo de entrada: BUTTERFIELD_TP02_E05_CALIFICACIONES.xml
 * Archivo de salida: informe_promedios.xml
 * @author Nicolas Butterfield
 * @version 1.1
 * @since Marzo 2025
 */

 import org.w3c.dom.*;
 import javax.xml.parsers.*;
 import javax.xml.transform.*;
 import javax.xml.transform.dom.DOMSource;
 import javax.xml.transform.stream.StreamResult;
 import java.io.File;
 import java.util.*;
 
 public class BUTTERFIELD_TP02_E06_CALIFICACIONES_PROMEDIOS {
     /**
      * Método principal que procesa el archivo de calificaciones, calcula promedios individuales
      * y generales, imprime los resultados por consola, y genera un nuevo XML con el informe.
      *
      * @param args No los utilizamos.
      */
     public static void main(String[] args) {
         try {
             File inputFile = new File("BUTTERFIELD_TP02_E05_CALIFICACIONES.xml");
 
             // Cargargo el XML de calificaciones creado en el ejercicio 5
             DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
             DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
             Document doc = dBuilder.parse(inputFile);
             doc.getDocumentElement().normalize();
 
             NodeList alumnos = doc.getElementsByTagName("alumno");
 
             // Agrupo las notas por nombre de alumno
             Map<String, List<Integer>> notasPorAlumno = new HashMap<>();
             double sumaTotal = 0;
             int totalNotas = 0;
 
             for (int i = 0; i < alumnos.getLength(); i++) {
                 Element alumno = (Element) alumnos.item(i);
                 String nombre = alumno.getElementsByTagName("nombre").item(0).getTextContent();
                 int nota = Integer.parseInt(alumno.getElementsByTagName("nota").item(0).getTextContent());
 
                 notasPorAlumno.putIfAbsent(nombre, new ArrayList<>());
                 notasPorAlumno.get(nombre).add(nota);
 
                 sumaTotal += nota;
                 totalNotas++;
             }
 
             // Creo el nuevo documento XML con el informe de promedios
             Document docNuevo = dBuilder.newDocument();
             Element root = docNuevo.createElement("informePromedios");
             docNuevo.appendChild(root);
 
             // Agrego el encabezado como comentario al principio del XML
             Comment encabezado = docNuevo.createComment(
                 " Trabajo Práctico Nº 2 - Tecnología XML\n" +
                 " Asignatura: Laboratorio de Programación\n" +
                 " Carrera: Analista de Sistemas / Licenciatura en Sistemas\n" +
                 " Universidad Nacional de la Patagonia Austral\n" +
                 " \n" +
                 " Ejercicio 6: Generar un informe con los promedios de alumnos a partir del XML\n" +
                 "             de calificaciones del ejercicio 5. El programa muestra por consola\n" +
                 "             el promedio de cada alumno, el promedio general, y genera un\n" +
                 "             nuevo documento XML con esta información.\n" +
                 " \n" +
                 " Archivo de entrada: BUTTERFIELD_TP02_E05_CALIFICACIONES.xml\n" +
                 " Archivo de salida: informe_promedios.xml\n" +
                 " Autor: Nicolas Butterfield\n" +
                 " Versión: 1.1\n" +
                 " Desde: Marzo 2025"
             );
             // Insertamos el comentario al inicio del documento, antes de la raíz
             docNuevo.insertBefore(encabezado, root);
             System.out.println("");

             // Muestro en consola
             System.out.println("=============================================");
             System.out.println("        INFORME DE PROMEDIOS DE ALUMNOS       ");
             System.out.println("=============================================\n");
 
             for (String nombre : notasPorAlumno.keySet()) {
                 List<Integer> notas = notasPorAlumno.get(nombre);
                 double promedio = notas.stream().mapToInt(Integer::intValue).average().orElse(0);
 
                 System.out.printf("Alumno: %-20s | Promedio: %.2f%n", nombre, promedio);
 
                 // Agrego al nuevo XML
                 Element alumno = docNuevo.createElement("alumno");
                 alumno.setAttribute("nombre", nombre);
 
                 Element promedioElem = docNuevo.createElement("promedio");
                 promedioElem.setTextContent(String.format("%.2f", promedio));
 
                 alumno.appendChild(promedioElem);
                 root.appendChild(alumno);
             }
 
             // Calculo y muestro el promedio general
             double promedioGeneral = sumaTotal / totalNotas;
             System.out.println("\n---------------------------------------------");
             System.out.printf("Promedio general de todos los alumnos: %.2f%n", promedioGeneral);
             System.out.println("---------------------------------------------");
             System.out.println("Archivo 'informe_promedios.xml' generado correctamente.");
             System.out.println("=============================================");
 
             // Agrego el promedio general al XML
             Element promedioGeneralElem = docNuevo.createElement("promedioGeneral");
             promedioGeneralElem.setTextContent(String.format("%.2f", promedioGeneral));
             root.appendChild(promedioGeneralElem);
 
             // Guardo el nuevo XML en el directorio actual
             Transformer transformer = TransformerFactory.newInstance().newTransformer();
             transformer.setOutputProperty(OutputKeys.INDENT, "yes");
             DOMSource source = new DOMSource(docNuevo);
             StreamResult result = new StreamResult(new File("informe_promedios.xml"));
             transformer.transform(source, result);
 
         } catch (Exception e) {
             e.printStackTrace();
         }
     }
 }
 