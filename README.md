# SIES IP, CFT y Universidades

![Vista de la página Resumen SIES en Power BI](docs/images/portada-power-bi.png)

Informe Power BI para analizar la matrícula de pregrado **no presencial y semipresencial** de Institutos Profesionales (IP), Centros de Formación Técnica (CFT) y Universidades en Chile entre 2023 y 2026.

El proyecto incluye datos públicos agregados de SIES, un modelo semántico documentado, medidas DAX, segmentadores y diez páginas de análisis. También conserva una vista institucional de ECS construida exclusivamente con información pública SIES.

> Este es un proyecto analítico independiente. No es un producto oficial de SIES ni del Ministerio de Educación.

## Inicio rápido

### Solo quiero visualizar el informe

1. Abra la sección **Releases** del repositorio.
2. Descargue `SIES_IP_CFT_U_v1.0.0.pbix`.
3. Ábralo con una versión reciente de Microsoft Power BI Desktop.

El PBIX incluye los datos importados y permite navegar inmediatamente. Para actualizar los CSV deberá configurar el parámetro `pCarpetaDatos` con una carpeta local válida.

### Quiero editar el proyecto PBIP

Requisitos:

- Windows 10 u 11.
- Microsoft Power BI Desktop estándar y actualizado; no la edición para Report Server.
- Windows PowerShell 5.1 o PowerShell 7.

Después de descargar o clonar el repositorio, ejecute desde la carpeta raíz:

```powershell
.\scripts\Preparar-PBIP.ps1 -Abrir
```

El script crea una copia local ignorada por Git, configura la ruta de datos y abre `.local\SIES_IP_CFT_U\SIES_IP_CFT_U.pbip`. Para recrearla posteriormente:

```powershell
.\scripts\Preparar-PBIP.ps1 -Recrear -Abrir
```

El proyecto original conserva una ruta genérica para evitar publicar nombres de usuario o ubicaciones personales.

## Qué puede analizarse

- Matrícula total y matrícula de primer año.
- Mercado IP+CFT y mercado universitario.
- Modalidad No Presencial o Semipresencial.
- Jornadas A Distancia, Diurna, Vespertina, Otra y Semipresencial.
- Institución, grupo institucional, carrera, área de conocimiento y territorio.
- Planes Regular, Continuidad y Otros, separados entre total y primer año.
- Participación, ranking, evolución anual y concentración competitiva.
- ECS frente al mercado, usando los mismos datos públicos SIES que el resto del informe.

## Páginas del informe

| Página | Contenido |
|---|---|
| 00 Resumen SIES | Indicadores ejecutivos y filtros principales |
| 01 Mercado IP+CFT | Tamaño, participación y ranking del subsistema técnico-profesional |
| 02 Mercado universitario | Matrícula total, primer año y continuidad universitaria |
| 03 Planes y continuidad | Regular, Continuidad y Otros, total y primer año |
| 04 Evolución 2023–2026 | Tendencias anuales por grupo de plan |
| 05 Portafolio ECS vs mercado | Comparación institucional y áreas de conocimiento |
| 06 Concentración por área | Distribución de matrícula por área |
| 07 Mapa competitivo | Grupos nominados y categorías residuales |
| 08 Detalle SIES | Matriz de consulta detallada |
| 09 Glosario y metodología | Definiciones, reglas y clasificación competitiva |

Todas las páginas analíticas incluyen filtros por **Año, Modalidad, Jornada, Grupo de plan y Subgrupo**.

## Criterios metodológicos principales

- **Regular:** Plan Regular.
- **Continuidad:** Plan Especial y Plan Regular de Continuidad.
- **Otros:** cualquier tipo de plan no incluido en los dos grupos anteriores.
- **Otros competidores:** grupos IP con menos de 900 matrículas de primer año en la base fija 2026.
- **U (otras):** grupos exclusivamente universitarios con menos de 70 matrículas de primer año en la base fija 2026.
- **CFT (otros):** CFT sin marca competitiva nominada; no utiliza umbral.

La matrícula de primer año es un subconjunto de la matrícula total y no debe sumarse como una categoría adicional. La metodología completa está en [docs/METODOLOGIA.md](docs/METODOLOGIA.md).

## Datos y privacidad

Los archivos incluidos contienen conteos agregados por institución, carrera, sede, modalidad, jornada y tipo de plan. No contienen nombres de estudiantes, RUT, correos, teléfonos ni identificadores personales.

El repositorio no incluye la planilla original, presentaciones internas, rutas de OneDrive, nombres de usuarios, cachés de Power BI ni archivos de recuperación. Consulte [PRIVACY.md](PRIVACY.md) antes de publicar una actualización.

## Estructura

```text
SIES_IP_CFT_U/
├── SIES_IP_CFT_U.pbip
├── SIES_IP_CFT_U.Report/
├── SIES_IP_CFT_U.SemanticModel/
├── SIES_IP_CFT_U.Data/
├── docs/
├── scripts/
└── release-assets/
```

- `SIES_IP_CFT_U.Report`: definición PBIR de páginas y objetos visuales.
- `SIES_IP_CFT_U.SemanticModel`: modelo TMDL, relaciones y medidas DAX.
- `SIES_IP_CFT_U.Data`: datos agregados y controles reproducibles.
- `scripts`: preparación local y revisión de privacidad.
- `release-assets`: instrucciones para publicar el PBIX, no el binario versionado.

## Actualización y validación

1. Sustituya los CSV curados manteniendo nombres, columnas y tipos.
2. Ejecute `Preparar-PBIP.ps1 -Recrear -Abrir`.
3. En Power BI seleccione **Inicio > Actualizar**.
4. Revise las conciliaciones descritas en [docs/VALIDACION.md](docs/VALIDACION.md).
5. Ejecute `.\scripts\Validar-Privacidad.ps1` antes de cualquier publicación.

## Publicar en GitHub

1. Cree en GitHub un repositorio público vacío llamado `SIES_IP_CFT_U`, sin agregar automáticamente README ni licencia.
2. Configure una identidad institucional de Git para evitar publicar un correo personal.
3. Desde esta carpeta ejecute:

```powershell
.\scripts\Validar-Privacidad.ps1
git init -b main
git add .
git status
git commit -m "Publicación inicial SIES_IP_CFT_U v1.0.0"
git remote add origin https://github.com/ORGANIZACION/SIES_IP_CFT_U.git
git push -u origin main
```

4. Sustituya `ORGANIZACION` por la cuenta institucional correspondiente.
5. Revise en GitHub que la imagen de portada, los enlaces y las licencias se visualicen correctamente.
6. Cree la Release `v1.0.0`, copie el contenido de `RELEASE_NOTES_v1.0.0.md` y adjunte el PBIX generado localmente.

Antes de `git add`, confirme que `git status` no muestre ningún archivo PBIX, Excel, PowerPoint, `.local` o caché `.pbi`.

## Licencias y atribución

Las definiciones del informe, el modelo y los scripts se publican bajo licencia MIT. Los datos derivados de SIES conservan la licencia **Creative Commons Atribución-NoComercial 2.0 Genérica (CC BY-NC 2.0)** indicada por el Portal de Datos Abiertos de Chile.

- Fuente: [Matrícula en Educación Superior — SIES/Mineduc](https://datosabiertos.mineduc.cl/matricula-en-educacion-superior/).
- Registro de licencia: [Portal de Datos Abiertos](https://datos.gob.cl/dataset/matricula-en-educacion-superior).
- Condiciones aplicables a los datos: [LICENSE-DATA.md](LICENSE-DATA.md).

## Contribuciones

Lea [CONTRIBUTING.md](CONTRIBUTING.md). No adjunte bases internas, archivos con datos personales ni capturas que muestren rutas o nombres de usuario.
