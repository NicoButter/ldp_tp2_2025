from lxml import etree

# Nombres de archivos
archivo_xml = "BUTTERFIELD_TP02_E04_A.xml"
archivo_xsl = "BUTTERFIELD_TP02_E04_B.xsl"
archivo_salida = "catalogo_generado.html"

try:
    # Cargar el XML y el XSLT
    print("📥 Cargando archivos...")
    xml = etree.parse(archivo_xml)
    xslt = etree.parse(archivo_xsl)

    # Aplicar transformación
    print("🔧 Aplicando transformación XSLT...")
    transformador = etree.XSLT(xslt)
    resultado = transformador(xml)

    # Guardar el resultado como HTML
    print(f"💾 Guardando HTML como '{archivo_salida}'...")
    resultado.write(archivo_salida, pretty_print=True, method="html", encoding="UTF-8")

    print("✅ ¡Transformación completada con éxito!")
    print(f"🗂️ HTML generado: {archivo_salida}")

except OSError as e:
    print(f"❌ Error de archivos: {e}")
except etree.XSLTApplyError as e:
    print(f"❌ Error al aplicar la transformación XSLT: {e}")
except Exception as e:
    print(f"⚠️ Algo salió mal: {e}")
