# Trabajo Práctico - Tecnología XML  
📚 **Universidad Nacional de la Patagonia Austral - Argentina**  
💻 **Asignatura:** Laboratorio de Programación  
🎓 **Carreras:** Analista de Sistemas y Licenciatura en Sistemas  

---

## 📌 Descripción

Este trabajo práctico tiene como objetivo aplicar los conocimientos sobre la tecnología **XML**, incluyendo la creación de documentos XML bien formados, esquemas XSD para validación, transformación de datos con XSLT y procesamiento de documentos XML mediante programación DOM.  

El desarrollo incluye distintos ejercicios que abarcan tanto modelado de datos como representación, validación, transformación y manipulación de la información.

---

## 📁 Contenido del Repositorio

### 1. 📄 `universidad.xml`  
Modelo de una universidad con estructura jerárquica, incluyendo carreras, asignaturas y alumnos.

### 2. 📄 `series.xml` + `series.xsd`  
Documentos XML que representan series de plataformas de streaming, siguiendo una estructura definida por un esquema XSD.

- Cada serie tiene:
  - Atributos obligatorios (`cod`, `titulo`) y opcional (`género`)
  - Lista de personajes (con atributos `id` y `tipo`, y elementos como nombre y género)
  - Trama
  - Hashtags relacionados

### 3. 📄 `catalogo.xml` + `catalogo.xsl` + `catalogo.html`  
Catálogo musical transformado en HTML mediante XSLT.

- El XML contiene CDs con datos como título, artista, país, compañía, precio y año.
- Se genera un HTML aplicando estilos con XSL.

### 4. 📄 `calificaciones.xml` + `calificaciones.xsl` + `calificaciones.html`  
Representación de calificaciones de alumnos con transformación visual en HTML.

- Colores según nota:
  - 🟢 Verde: Nota > 70  
  - 🟡 Amarillo: 40–70  
  - 🔴 Rojo: < 40  
- Alumnos recursantes marcados con `(*)`
- Título dinámico según la fecha
- Resumen con:
  - Total de alumnos
  - Aprobados (nota > 70)
  - Desaprobados

### 5. 🧠 `aprobados.xml`  
Archivo generado automáticamente que contiene únicamente a los alumnos aprobados.

### 6. 💻 `informeDOM.java` *(o .py, .js, según lenguaje)*  
Programa que procesa el XML de calificaciones mediante DOM:

- Calcula el promedio por alumno
- Calcula el promedio general
- Genera un nuevo archivo XML con el informe de resultados

---

## ✅ Requisitos para ejecutar

- Navegador moderno para ver el resultado de XSLT
- Procesador XSLT (o simplemente abrir el XML con XSL vinculado en un navegador)
- JDK o intérprete de lenguaje usado para DOM (ej. Python con lxml, Java con JAXP, etc.)

---

## 🛠️ Tecnologías utilizadas

- XML 1.0  
- XSD (XML Schema Definition)  
- XSLT 1.0  
- HTML 5  

---

## 🙋‍♂️ Contacto

¿Tenés alguna duda, sugerencia o querés charlar sobre XML, programación o teorías conspirativas sobre por qué XSLT aún existe?

📧 **Email:** nicobutter@gmail.com  

## 🚀 Autor

##Nicolás Butterfield
Estudiante de la UNPA - Carrera de Licenciatura en Sistemas  
Apasionado por el desarrollo, el código limpio y las buenas prácticas.  
_"Escribir XML sin cerrar etiquetas es como dejar la heladera abierta: algo se va a pudrir."_ 😅
