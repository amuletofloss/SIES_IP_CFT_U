# Privacidad y publicación segura

## Clasificación de la información

Este repositorio contiene información pública y agregada sobre matrícula en educación superior. La unidad mínima del hecho analítico es una combinación de año, institución, carrera, modalidad, jornada, plan y ubicación; no corresponde a una persona.

No se incluyen:

- nombres o identificadores de estudiantes;
- RUT, correos, teléfonos o domicilios personales;
- credenciales, tokens o conexiones autenticadas;
- rutas con nombres de usuario;
- archivos de origen internos;
- cachés o configuraciones locales de Power BI.

Los nombres de instituciones, carreras, sedes y comunas corresponden a categorías públicas de la fuente SIES.

## Control previo a cada publicación

Ejecute:

```powershell
.\scripts\Validar-Privacidad.ps1
```

Además, revise manualmente:

1. que ninguna captura muestre la barra de título, el Explorador de archivos o notificaciones;
2. que `pCarpetaDatos` use la ruta genérica del proyecto versionado;
3. que no existan PBIX, Excel, PPTX, archivos de recuperación o carpetas `.pbi` preparados para commit;
4. que los cambios de datos sigan siendo agregados y provengan de una fuente publicable;
5. que los archivos de una GitHub Release hayan pasado el mismo escaneo.

## Reporte de un problema

Si se detecta información privada, no la publique en una incidencia pública. Retire el archivo de la publicación y comunique el hallazgo al responsable del repositorio mediante un canal institucional privado.

