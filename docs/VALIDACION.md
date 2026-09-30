# Validación de la versión pública

Fecha base: 30-09-2026.

## Resultado de esta entrega

- 0 errores estructurales PBIR/PBIP.
- 1 advertencia externa `PBIR_SCHEMA_UNREACHABLE`: el validador no pudo descargar el esquema Microsoft `visualContainer/2.11.0`; no corresponde a un defecto del informe.
- Las 10 páginas fueron renderizadas con datos y revisadas visualmente.
- La revisión automatizada de privacidad terminó sin coincidencias.

## Controles técnicos esperados

- Validación PBIR/PBIP: 0 errores. Una advertencia solo es aceptable si indica exclusivamente que no se pudo descargar un esquema oficial de Microsoft; no debe existir ninguna advertencia sobre el contenido del informe.
- Diez páginas reconocidas por Power BI Desktop.
- Modelo actualizado con 4.463 filas de hechos.
- 4 años, 69 instituciones, 2 modalidades, 5 jornadas y 3 tipos SIES de plan.
- 25 términos públicos de glosario, sin referencias internas.
- 50 registros de auditoría y 44 grupos en el catálogo competitivo.
- 4.463 códigos de carrera con nombre, área genérica y ambas duraciones informadas.
- 498 códigos donde la duración de estudio y la duración total son diferentes.

## Totales 2026

| Indicador | Valor esperado |
|---|---:|
| Matrícula total | 229.492 |
| Matrícula primer año SIES | 63.422 |
| Regular Total | 175.270 |
| Regular 1er año | 61.137 |
| Especial Total | 9.701 |
| Especial 1er año | 2.285 |
| Continuidad Total | 44.521 |
| Especial Total universidades | 3.252 |
| Especial 1er año universidades | 980 |
| Continuidad Total universidades | 36.982 |
| ECS matrícula total | 7.918 |
| ECS Regular 1er año | 2.281 |
| ECS Especial Total / primer año | 2.354 / 0 |
| ECS ranking Regular P1 IP+CFT | 6 |

## Conciliaciones

- `Matrícula total = Regular Total + Especial Total + Continuidad Total`.
- `Matrícula primer año SIES = Regular 1er año + Especial 1er año`.
- `Primer año según tipo SIES` debe devolver vacío para Continuidad.

Ambas identidades deben cumplirse con y sin filtros.

## Prueba de filtros

Para 2026, Modalidad Semipresencial y Jornada Semipresencial:

| Indicador | Valor esperado |
|---|---:|
| Matrícula total | 21.823 |
| Matrícula primer año SIES | 5.923 |
| Regular Total / primer año | 17.655 / 5.792 |
| Especial Total / primer año | 294 / 131 |
| Continuidad Total / primer año | 3.874 / no aplica |

## Privacidad

La versión publicable debe obtener cero coincidencias para rutas de usuario, nombres personales, correos, contraseñas, secretos, tokens o referencias al propósito y a presentaciones internas del proyecto original.
