/* ●	Empleados sin ausencias en octubre de 2024. Mostrar: nombre del empleado. */

select     
-- Armo el nombre completo 
    CONCAT_WS(' ',
        e.primer_nombre,
        e.segundo_nombre,
        e.primer_apellido,
        e.segundo_apellido
    ) AS nombre_empleado

	from empleados e
	--verifico que el empleado se encuentre activo
	where e.activo= 1
	--comparo que la id del empleado no tenga registros en la tabla de ausencias en octubre de 2024
	AND NOT EXISTS (
	Select *
	FROM ausencias a
	where a.empleado_id = e.empleado_id
		AND a.fecha >= '2024-10-01'
		AND a.fecha <= '2024-10-31'
		)
	order by empleado_id asc