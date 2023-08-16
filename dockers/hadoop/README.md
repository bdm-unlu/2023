# Guía de docker de Hadoop

## docker-compose

Usamos el archivo de big-data-europe que ya está configurado

```git clone https://github.com/big-data-europe/docker-hadoop.git docker-hadoop```

```cd docker-hadoop```

```docker-compose up```

* Referencia -> https://github.com/big-data-europe/docker-hadoop

### Copiar un archivo al contenedor

```docker cp ARCHIVO NOMBRECONTENEDOR:ARCHIVO```

### Entrar a la consola del contenedor

```docker exec -it NOMBRECONTENEDOR bash```

### Copiar un archivo al cluster

```hdfs dfs -put archivo destino```

Ejemplo copiando una carpeta entera

```hdfs dfs -put ./input/* input```

### Correr ejemplo en java

```hadoop jar wc.jar WordCount input output```