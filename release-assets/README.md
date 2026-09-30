# Activos de GitHub Release

El archivo `SIES_IP_CFT_U_v1.1.0.pbix` se genera localmente en esta carpeta, pero está excluido por `.gitignore` y no debe incorporarse al historial Git.

Procedimiento de publicación:

1. Valide y actualice el PBIP público.
2. En Power BI Desktop use **Archivo > Guardar como** y seleccione formato PBIX.
3. Después de actualizar los datos, restablezca `pCarpetaDatos` a la ruta genérica documentada para no incluir rutas personales.
4. Guarde el archivo como `SIES_IP_CFT_U_v1.1.0.pbix` en esta carpeta.
5. Ejecute `scripts/Validar-Privacidad.ps1 -IncluirBinarios`.
6. Calcule y registre su tamaño y SHA-256 en `RELEASE_NOTES_v1.1.0.md`.
7. Cree la Release `v1.1.0` y adjunte el PBIX como activo descargable.

El PBIX debe abrir con los datos importados aunque la carpeta de CSV no exista. La actualización de datos se realiza desde el PBIP preparado localmente.
