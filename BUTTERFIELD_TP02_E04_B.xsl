<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Catálogo de CDs</title>
                <style>
                    table { border-collapse: collapse; width: 80%; margin: 20px auto; }
                    th, td { border: 1px solid black; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                </style>
            </head>
            <body>
                <h1>Catálogo de CDs</h1>
                <table>
                    <tr>
                        <th>Título</th>
                        <th>Artista</th>
                        <th>País</th>
                        <th>Compañía</th>
                        <th>Precio</th>
                        <th>Año</th>
                    </tr>
                    <xsl:apply-templates select="catalogo/cd"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="cd">
        <tr>
            <td>
                <xsl:value-of select="titulo"/>
            </td>
            <td>
                <xsl:value-of select="artista"/>
            </td>
            <td>
                <xsl:value-of select="pais"/>
            </td>
            <td>
                <xsl:value-of select="compania"/>
            </td>
            <td>
                <xsl:value-of select="precio"/>
            </td>
            <td>
                <xsl:value-of select="anio"/>
            </td>
        </tr>
    </xsl:template>
</xsl:transform>