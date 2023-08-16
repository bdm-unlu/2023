# Pentaho, MySQL y phpMyAdmin

Para levantar el entorno

```docker-compose up```

Se puede acceder a Pentaho desde http://localhost:8080

 - USUARIO: admin
 - CLAVE: password

La base de datos queda en el puerto 3306.

Al phpMyAdmin se accede desde: http://localhost:6030

- USUARIO: root
- CLAVE: bdm

Para conectar la base de datos tanto desde el phpMyAdmin como desde Pentaho, se debe usar el host *pentaho_mysql* y el puerto *3306*.

## Schema Workbench

Para conectar la base de datos desde el Schema Workbench, el host es *127.0.0.1* y puerto *3306*.

Para publicar un cubo a Pentaho:

 - DIRECCIÓN: http://localhost:8080/pentaho/
 - USUARIO: admin
 - CLAVE: password

**Descarga Mondrian Schema Workbench**

https://sourceforge.net/projects/mondrian/files/schema%20workbench/3.14.0/

**JRE/JDK necesario**

Para ejecutar el Schema Workbench es necesario tener instalado Java. Para la instalación, se puede seguir la [Guía](https://github.com/bdm-unlu/2020/blob/master/guias/Java_configuracion.md).

## Pentaho Data Integration

Para conectar la base de datos desde el PDI, el host es *127.0.0.1* y puerto *3306*.

**Descarga Pentaho Data Integration**

https://sourceforge.net/projects/pentaho/files/latest/download?aliId=137249511

**JDK necesario**

Para ejecutar Pentaho Data Integration, es necesario instalar el JDK 8

```sudo apt-get install openjdk-8-jdk```


La guía de instalación completa de la Suite Pentaho está [aquí](https://github.com/bdm-unlu/2020/blob/master/guias/Guia_Instalacion_Pentaho.md).
