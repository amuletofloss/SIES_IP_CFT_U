# Metodología

## Universo

El informe utiliza matrícula de pregrado informada por SIES para instituciones de tipo Instituto Profesional (IP), Centro de Formación Técnica (CFT) y Universidad (U). Se incluyen las modalidades **No Presencial** y **Semipresencial** entre 2023 y 2026; se excluyen programas presenciales, de posgrado y postítulo.

Las medidas sin un filtro explícito de año muestran el último año disponible, actualmente 2026.

## Matrícula total y primer año

- **Matrícula total:** suma de `TotalMatricula` dentro del contexto de filtros.
- **Matrícula primer año:** suma de `PrimerAnio` dentro del mismo contexto.
- Primer año es un subconjunto del total; no se suma al total como una categoría adicional.

## Clasificación de planes

| Grupo | Tipo SIES incluido |
|---|---|
| Regular | Plan Regular |
| Continuidad | Plan Especial; Plan Regular de Continuidad |
| Otros | Cualquier valor diferente de los anteriores |

Cada grupo tiene medidas separadas para matrícula total y primer año.

## Regla de consistencia

La revisión se realiza por institución y año:

1. Si existe matrícula de primer año, la institución-año se conserva.
2. Si la matrícula de primer año es cero, solo se conserva cuando toda su matrícula corresponde al tipo SIES `Plan Regular de Continuidad`.
3. En los demás casos se excluye y se registra el motivo en `auditoria_exclusiones.csv`.

La excepción utiliza el tipo SIES exacto y no el grupo amplio **Continuidad**, que también contiene Plan Especial.

## Agrupaciones competitivas

La pertenencia se fija con la matrícula de primer año 2026. Una vez clasificada una institución, sus matrículas responden normalmente a los filtros y años del informe.

| Segmento | Regla fija 2026 |
|---|---|
| CFT (otros) | CFT que no pertenece a una marca competitiva nominada; sin umbral |
| Otros competidores | Grupo IP con menos de 900 matrículas de primer año |
| U (otras) | Grupo exclusivamente universitario con menos de 70 matrículas de primer año |

Los integrantes, estados y volúmenes base están en `clasificacion_competitiva.csv` y en la página 09.

## Agrupación ECS

ECS agrupa:

- IP Escuela de Comercio de Santiago.
- CFT Escuela de Comercio.

Todas las métricas ECS del informe se calculan con la misma fuente pública SIES utilizada para el resto de las instituciones.

## Interpretación responsable

- Los datos se basan en reportes oficiales agregados, pero las agrupaciones, nombres competitivos y reglas de exclusión son decisiones analíticas de este proyecto.
- Un ranking depende de los filtros activos y del universo definido.
- Una matrícula cero puede reflejar ausencia de registros válidos en el universo filtrado y no necesariamente inactividad total de la institución.
- Las cifras no deben interpretarse como proyecciones ni como datos individuales de estudiantes.

