# Diccionario de datos

## Archivos de datos

| Archivo | Propósito | Campos principales |
|---|---|---|
| `fact_matricula.csv` | Hechos agregados de matrícula | Año, institución, carrera, modalidad, jornada, plan, territorio, total y primer año |
| `dim_anio.csv` | Años disponibles | Año |
| `dim_institucion.csv` | Instituciones y agrupaciones | ID, nombre, grupo, tipo, acreditación y segmento competitivo |
| `dim_carrera.csv` | Carreras y clasificaciones académicas | ID, nombre, área genérica, CINE, duraciones y acreditación |
| `dim_modalidad.csv` | Modalidades incluidas | Modalidad |
| `dim_jornada.csv` | Jornadas incluidas | Jornada |
| `dim_plan.csv` | Taxonomía de planes | Tipo SIES, tipo analítico y orden |
| `glosario.csv` | Definiciones visibles en el informe | Término, definición, regla, fuente y advertencia |
| `auditoria_exclusiones.csv` | Instituciones-año no incorporadas | Año, institución, matrículas y motivo |
| `clasificacion_competitiva.csv` | Membresías competitivas fijas | Segmento, grupo, integrantes, total y P1 Regular base 2026 |
| `control_totales.json` | Controles reproducibles | Origen, filas, exclusiones y totales anuales |

## Tabla de hechos

`fact_matricula.csv` contiene una fila por combinación válida de:

- `Anio`
- `InstitucionID`
- `CarreraKey`
- `Modalidad`
- `Jornada`
- `TipoPlan`
- `Region`, `Provincia`, `Comuna`, `Sede`

Las columnas numéricas son:

- `TotalMatricula`: matrícula total agregada.
- `PrimerAnio`: matrícula agregada de primer año.

No contiene registros de personas.

## Dimensión de carreras

- `NombreCarrera`: nombre textual informado por la institución; no está normalizado.
- `AreaCarreraGenerica`: clasificación normalizada SIES que agrupa nombres de carreras relacionados.
- `DuracionEstudio`: semestres de estudio informados por SIES.
- `DuracionTotal`: semestres totales informados por SIES; puede incluir una etapa adicional.

Las duraciones son atributos enteros no sumables. La jerarquía visible del modelo es **Área carrera genérica > Nombre carrera**.

## Medidas DAX

### Volumen

- Matrícula total
- Matrícula primer año SIES
- % Regular 1er año
- Matrícula total IP+CFT
- Regular 1er año IP+CFT
- Matrícula total universidades
- Regular 1er año universidades

### Planes

- Regular Total
- Regular 1er año
- Especial Total
- Especial 1er año
- Continuidad Total
- Primer año según tipo SIES
- Especial Total universidades
- Especial 1er año universidades
- Continuidad Total universidades

### Participación y ranking

- Participación Regular P1
- Participación Regular P1 área
- Ranking Regular P1 IP+CFT
- Variación Regular P1 interanual

### ECS

- ECS matrícula total
- ECS Regular 1er año
- Participación ECS Regular P1 IP+CFT
- ECS ranking Regular P1 IP+CFT

## Relaciones principales

La tabla `FactMatricula` se relaciona en dirección de filtro simple con las dimensiones de año, institución, carrera, modalidad, jornada y plan. Las tablas de glosario, auditoría y clasificación competitiva son tablas de consulta independientes.
