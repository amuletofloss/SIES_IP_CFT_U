# Validación de la versión pública

Fecha base: 24-09-2026.

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
- 21 términos públicos de glosario después de retirar la referencia interna a la presentación.
- 50 registros de auditoría y 39 grupos en el catálogo competitivo.

## Totales 2026

| Indicador | Valor esperado |
|---|---:|
| Matrícula total | 229.492 |
| Matrícula primer año | 63.422 |
| Regular Total | 175.270 |
| Regular 1er año | 61.137 |
| Continuidad Total | 54.222 |
| Continuidad 1er año | 2.285 |
| Otros Total | 0 |
| Otros 1er año | 0 |
| Continuidad Total universidades | 40.234 |
| Continuidad 1er año universidades | 980 |
| ECS matrícula total | 7.918 |
| ECS matrícula primer año | 2.281 |
| ECS ranking P1 IP+CFT | 6 |

## Conciliaciones

- `Matrícula total = Regular Total + Continuidad Total + Otros Total`.
- `Matrícula primer año = Regular 1er año + Continuidad 1er año + Otros 1er año`.

Ambas identidades deben cumplirse con y sin filtros.

## Prueba de filtros

Para 2026, Modalidad Semipresencial y Jornada Semipresencial:

| Indicador | Valor esperado |
|---|---:|
| Matrícula total | 21.823 |
| Matrícula primer año | 5.923 |
| Regular Total / primer año | 17.655 / 5.792 |
| Continuidad Total / primer año | 4.168 / 131 |
| Otros Total / primer año | 0 / 0 |

## Privacidad

La versión publicable debe obtener cero coincidencias para rutas de usuario, nombres personales, correos, contraseñas, secretos, tokens o referencias al propósito y a presentaciones internas del proyecto original.
