/*●	Comparación salarial por departamento. 
Para cada empleado, mostrar su nombre, 
el salario promedio de su departamento y cuánto está por encima o por debajo de ese promedio.

*/
WITH activos AS (
    SELECT *
    FROM empleados
    WHERE activo = 1  -- trabajo solo con empleados activos
)

SELECT
    -- Nombre completo armado de forma segura
    CONCAT_WS(' ',
        e.primer_nombre,
        e.segundo_nombre,
        e.primer_apellido,
        e.segundo_apellido
    ) AS nombre_empleado,

    d.nombre AS departamento,  -- nombre del departamento

    e.salario AS salario_empleado,  -- salario del empleado

    -- Promedio del departamento usando función OVER
    AVG(e.salario) OVER (PARTITION BY e.departamento_id)
        AS salario_promedio_departamento,

    -- Diferencia entre su salario y el promedio del depto
    e.salario - AVG(e.salario) OVER (PARTITION BY e.departamento_id)
        AS diferencia_vs_promedio

   

FROM activos e
INNER JOIN departamentos d ON d.departamento_id = e.departamento_id
ORDER BY e.departamento_id, nombre_empleado;
