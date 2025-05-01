<?xml version="1.0" encoding="UTF-8"?>

<!--
    Ejercicio de la materia "Laboratorio de Programación" de la carrera Licenciatura en Sistemas,
    Universidad Nacional de la Patagonia Austral (UNPA).

    Este archivo XSLT transforma el archivo XML de calificaciones de alumnos correspondiente al día 
    29-05-2009, generando xml correspondiente.

    Con este comando en mi terminal de openSUSE :ls BUTTERFIELD_TP02_E05_APROBADOS_XML.xsl
    se hace el xml.

    Realizado como parte del trabajo práctico n°2, ejercicio 05.

    Autor: Nicolás Butterfield
    Año: 2025
-->

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>

  <!-- Plantilla principal -->
  <xsl:template match="/">
    <aprobados>
      <!-- Recorremos alumnos cuya nota es mayor a 70 -->
      <xsl:for-each select="calificaciones/alumno[nota &gt; 70]">
        <alumno>
          <nombre><xsl:value-of select="nombre"/></nombre>
          <materia><xsl:value-of select="materia"/></materia>
          <nota><xsl:value-of select="nota"/></nota>
        </alumno>
      </xsl:for-each>
    </aprobados>
  </xsl:template>

</xsl:stylesheet>
