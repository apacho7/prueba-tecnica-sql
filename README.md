# Prueba Técnica DBA SQL Server 

Este repositorio contiene la solución completa a la prueba técnica solicitada.  
Incluye los scripts SQL organizados, el backup funcional de la base de datos y la documentación en PDF.

---

## 📌 Contenido

### 1. Scripts SQL
Ubicados en la carpeta **/scripts**:

- `01_creacion_db.sql`  
  Contiene la creación de la base de datos y  del esquema requerido (departamentos, empleados y ausencias).

- `02_insercion_datos.sql`  
  Inserciones utilizadas para poblar la base de datos con datos de prueba.

- `03_consulta_1.sql`
- `04_consulta_2.sql`
- `05_consulta_3.sql`  
  Incluyen las consultas solicitadas en los puntos de la prueba:
  - Ausencias por empleado en octubre de 2024 y tipo de ausencia más común.
  - Comparación salarial por departamento.
  - Empleados sin ausencias en el periodo.


---

## 📌 Backup de la Base de Datos

En **/backup** se incluye el archivo:

- `pruebaDBA.bak`

Este backup fue generado desde SQL Server 2019.  
Puede restaurarse directamente en cualquier instancia compatible para validar el funcionamiento de los scripts.

---

## 📌 Documentación

En la carpeta **/documentacion** se encuentra:

- `prueba_tecnica.pdf`  
  Documento que explica la solución, incluye los scripts y visualización del resultado de las consultas.

---

## 📌 Requisitos

- SQL Server 2019 o superior  
- Permisos para ejecutar scripts de creación y restauración de base de datos

---

## 📌 Restauración rápida

1. Abrir SQL Server Management Studio  
2. Click derecho en "Databases"  
3. "Restore Database"  
4. Seleccionar el archivo `pruebaDBA.bak`  
5. Restaurar

---

## 📌 Autor
Desarrollado por **Jose Miguel Acevedo Castellanos**, como parte del proceso de evaluación técnica.
