# Apache Drill, MySQL y PostgreSQL

Para levantar el entorno

```docker-compose up```

Se puede acceder a Drill desde http://localhost:8047

MySQL queda en el puerto 6603 hacia afuera y 3306 hacia adentro.

Al phpMyAdmin se accede desde: http://localhost:6030

- USUARIO: root
- CLAVE: bdm

PostgreSQL queda en el puerto 5470 hacia afuera y 5432 hacia adentro.

Al pgAdmin4 se accede desde: http://localhost:6040

- USUARIO: bdm@bdm.com
- CLAVE: bdm

## Ejemplo de conexión a MySQL

```
{
  "type": "jdbc",
  "driver": "com.mysql.jdbc.Driver",
  "url": "jdbc:mysql://drill_mysql:3306",
  "username": "root",
  "password": "bdm",
  "caseInsensitiveTableNames": false,
  "sourceParameters": {},
  "enabled": true
}
```

## Ejemplo de conexión a PostgreSQL

```
{
  "type": "jdbc",
  "driver": "org.postgresql.Driver",
  "url": "jdbc:postgresql://drill_postgres/BASEDEDATOS",
  "username": "postgres",
  "password": "postgres",
  "caseInsensitiveTableNames": false,
  "sourceParameters": {},
  "enabled": true
}
```

## Ejemplo de query a un archivo JSON

El archivo debe ubicarse en la carpeta data que es la que se le comparte a drill

```
SELECT * FROM dfs.`/data/paises.json`
```