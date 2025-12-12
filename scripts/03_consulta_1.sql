/* 
   Empleados con más de una ausencia en octubre 2024
  
*/

SELECT
    --e.empleado_id,

    -- Armo el nombre completo 
    CONCAT_WS(' ',
        e.primer_nombre,
        e.segundo_nombre,
        e.primer_apellido,
        e.segundo_apellido
    ) AS nombre_empleado,

    -- Total de días que faltó 
    COUNT(*) AS cantidad_dias_ausencia,

    -- Tipo de ausencia más repetido para ese empleado
    (
        SELECT TOP 1 a2.tipo
        FROM ausencias a2
        WHERE a2.empleado_id = e.empleado_id
		--aplico las fechas que estamos buscando (mes de octubre de 2024)
          AND a2.fecha >= '2024-10-01'
          AND a2.fecha <  '2024-11-01'
        GROUP BY a2.tipo
        ORDER BY COUNT(*) DESC 
    ) AS tipo_ausencia_mas_comun

FROM empleados e
JOIN ausencias a
  ON a.empleado_id = e.empleado_id
  AND a.fecha >= '2024-10-01'   -- solo octubre
  AND a.fecha <  '2024-11-01'

-- Toca agrupar por empleado y nombre
GROUP BY
    e.empleado_id,
    CONCAT_WS(' ',
        e.primer_nombre,
        e.segundo_nombre,
        e.primer_apellido,
        e.segundo_apellido
    )

HAVING COUNT(*) > 1 -- solo los que faltaron más de una vez
ORDER BY cantidad_dias_ausencia DESC, nombre_empleado;
