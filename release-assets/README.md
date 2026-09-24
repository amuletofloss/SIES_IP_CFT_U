# Activos de GitHub Release

El archivo `SIES_IP_CFT_U_v1.0.0.pbix` se genera localmente en esta carpeta, pero está excluido por `.gitignore` y no debe incorporarse al historial Git.

Procedimiento de publicación:

1. Valide y actualice el PBIP público.
2. En Power BI Desktop use **Archivo > Guardar como** y seleccione formato PBIX.
3. Guarde el archivo como `SIES_IP_CFT_U_v1.0.0.pbix` en esta carpeta.
4. Ejecute `scripts/Validar-Privacidad.ps1 -IncluirBinarios`.
5. Calcule y registre su SHA-256 en `RELEASE_NOTES_v1.0.0.md`.
6. Cree la Release `v1.0.0` y adjunte el PBIX como activo descargable.

