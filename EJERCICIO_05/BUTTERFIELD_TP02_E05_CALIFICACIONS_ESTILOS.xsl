<?xml version="1.0" encoding="UTF-8"?>
<!--
    Ejercicio de la materia "Laboratorio de Programación" de la carrera Licenciatura en Sistemas,
    Universidad Nacional de la Patagonia Austral (UNPA).

    Este archivo XSLT transforma el archivo XML de calificaciones de alumnos correspondiente al día 
    29-05-2009, generando una visualización en HTML que muestra los detalles de los alumnos, incluyendo 
    su nombre, materia, carrera, nota y tipo (recursante/no recursante).

    Realizado como parte del trabajo práctico n°2, ejercicio 05.

    Autor: Nicolás Butterfield
    Año: 2025
-->
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Calificaciones del <xsl:value-of select="calificaciones/@fecha" />
                </title>
                <style>
                    table {
                    border-collapse: collapse;
                    width: 80%;
                    margin: 20px auto;
                    }
                    th, td {
                    border: 1px solid #ddd;
                    padding: 8px;
                    text-align: left;
                    }
                    th {
                    background-color: #f2f2f2;
                    }
                    .verde {
                    background-color: #90EE90;
                    }
                    .amarillo {
                    background-color: #FFFF99;
                    }
                    .rojo {
                    background-color: #FF9999;
                    }
                    .resumen {
                    margin-top: 20px;
                    font-weight: bold;
                    }
                </style>
            </head>
            <body>
                <h1>Calificaciones del <xsl:value-of select="calificaciones/@fecha" />
                </h1>

                <!-- Tabla de calificaciones -->
                <table>
                    <tr>
                        <th>Nombre</th>
                        <th>Materia</th>
                        <th>Nota</th>
                    </tr>
                    <xsl:for-each select="calificaciones/alumno">
                        <xsl:sort select="nota" data-type="number" order="descending" />
                        <tr>
                            <td>
                                <xsl:value-of select="nombre" />
                                <xsl:if test="@tipo='recursante'"> (*)</xsl:if>
                            </td>
                            <td>
                                <xsl:value-of select="materia" />
                            </td>
                            <td>
                                <xsl:attribute name="class">
                                    <xsl:choose>
                                        <xsl:when test="nota > 70">verde</xsl:when>
                                        <xsl:when test="nota >= 40 and nota &lt;= 70">amarillo</xsl:when>
                                        <xsl:otherwise>rojo</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:value-of select="nota" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <!-- Nota sobre recursantes -->
                <xsl:if test="calificaciones/alumno[@tipo='recursante']">
                    <p>(*) Indica alumno recursante</p>
                </xsl:if>

                <!-- Resumen -->
                <div class="resumen">
                    <p>Total alumnos: <xsl:value-of select="count(calificaciones/alumno)" />
                    </p>
                    <p>Aprobados (nota > 70): <xsl:value-of select="count(calificaciones/alumno[nota > 70])" />
                    </p>
                    <p>Desaprobados: <xsl:value-of select="count(calificaciones/alumno[nota &lt;= 70])" />
                    </p>
                </div>

                <!-- Generar archivo XML con aprobados -->
                <xsl:result-document href="aprobados.xml" method="xml" indent="yes">
                    <aprobados>
                        <xsl:for-each select="calificaciones/alumno[nota > 70]">
                            <alumno>
                                <nombre>
                                    <xsl:value-of select="nombre" />
                                </nombre>
                                <materia>
                                    <xsl:value-of select="materia" />
                                </materia>
                                <nota>
                                    <xsl:value-of select="nota" />
                                </nota>
                            </alumno>
                        </xsl:for-each>
                    </aprobados>
                </xsl:result-document>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
