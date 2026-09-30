# Metodología

## Universo

El informe utiliza matrícula de pregrado informada por SIES para instituciones de tipo Instituto Profesional (IP), Centro de Formación Técnica (CFT) y Universidad (U). Se incluyen las modalidades **No Presencial** y **Semipresencial** entre 2023 y 2026; se excluyen programas presenciales, de posgrado y postítulo.

Las medidas sin un filtro explícito de año muestran el último año disponible, actualmente 2026.

## Matrícula total y primer año

- **Matrícula total:** suma de `TotalMatricula` dentro del contexto de filtros.
- **Matrícula primer año SIES:** suma de `PrimerAnio`; incluye Plan Regular y Plan Especial.
- **Regular 1er año:** primer año de Plan Regular y principal indicador de captación, participación, ranking y segmentación.
- Plan Regular de Continuidad no se considera posible de contar con estudiantes de primer año; en los visuales se muestra como no aplicable.

## Clasificación de planes

| Tipo analítico | Tipo SIES incluido | Primer año |
|---|---|---|
| Regular | Plan Regular | Sí |
| Especial | Plan Especial | Sí, separado de Regular |
| Continuidad | Plan Regular de Continuidad | No aplica |

SIES define Plan Especial como un programa dirigido a un grupo específico de estudiantes. Plan Regular de Continuidad exige haber cursado y aprobado un programa regular o 1.600 horas pedagógicas en educación superior. No son categorías equivalentes.

El tipo de plan es autorreportado por cada institución. El informe conserva el valor publicado por SIES y no reclasifica ofertas que parezcan inconsistentes con la definición; esa limitación se informa en el glosario.

## Regla de consistencia

La revisión se realiza por institución y año:

1. Si existe matrícula de primer año, la institución-año se conserva.
2. Si la matrícula de primer año es cero, solo se conserva cuando toda su matrícula corresponde al tipo SIES `Plan Regular de Continuidad`.
3. En los demás casos se excluye y se registra el motivo en `auditoria_exclusiones.csv`.

La excepción utiliza exclusivamente el tipo SIES `Plan Regular de Continuidad`.

## Agrupaciones competitivas

La pertenencia se fija con la matrícula regular de primer año 2026. Una vez clasificada una institución, sus matrículas responden normalmente a los filtros y años del informe.

| Segmento | Regla fija 2026 |
|---|---|
| CFT (otros) | CFT que no pertenece a una marca competitiva nominada; sin umbral |
| Otros competidores | Grupo IP con menos de 900 matrículas regulares de primer año |
| U (otras) | Grupo exclusivamente universitario con menos de 70 matrículas regulares de primer año |

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
