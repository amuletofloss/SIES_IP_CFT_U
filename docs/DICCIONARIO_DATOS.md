# Diccionario de datos

## Archivos de datos

| Archivo | Propósito | Campos principales |
|---|---|---|
| `fact_matricula.csv` | Hechos agregados de matrícula | Año, institución, carrera, modalidad, jornada, plan, territorio, total y primer año |
| `dim_anio.csv` | Años disponibles | Año |
| `dim_institucion.csv` | Instituciones y agrupaciones | ID, nombre, grupo, tipo, acreditación y segmento competitivo |
| `dim_carrera.csv` | Carreras y clasificaciones académicas | ID, nombre, área, CINE y acreditación |
| `dim_modalidad.csv` | Modalidades incluidas | Modalidad |
| `dim_jornada.csv` | Jornadas incluidas | Jornada |
| `dim_plan.csv` | Taxonomía de planes | Tipo SIES, grupo, subgrupo y orden |
| `glosario.csv` | Definiciones visibles en el informe | Término, definición, regla, fuente y advertencia |
| `auditoria_exclusiones.csv` | Instituciones-año no incorporadas | Año, institución, matrículas y motivo |
| `clasificacion_competitiva.csv` | Membresías competitivas fijas | Segmento, grupo, integrantes, total y P1 base 2026 |
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

## Medidas DAX

### Volumen

- Matrícula total
- Matrícula primer año
- % primer año
- Matrícula total IP+CFT
- Matrícula primer año IP+CFT
- Matrícula total universidades
- Matrícula primer año universidades

### Planes

- Regular Total
- Regular 1er año
- Continuidad Total
- Continuidad 1er año
- Otros Total
- Otros 1er año
- Continuidad Total universidades
- Continuidad 1er año universidades

### Participación y ranking

- Participación P1
- Participación P1 área
- Ranking P1 IP+CFT
- Variación P1 interanual

### ECS

- ECS matrícula total
- ECS matrícula primer año
- Participación ECS P1 IP+CFT
- ECS ranking P1 IP+CFT

## Relaciones principales

La tabla `FactMatricula` se relaciona en dirección de filtro simple con las dimensiones de año, institución, carrera, modalidad, jornada y plan. Las tablas de glosario, auditoría y clasificación competitiva son tablas de consulta independientes.

