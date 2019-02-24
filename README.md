# elastic-search-app

### instalar elasticsearch
``brew install elasticsearch``


### montar el servidor de elasticsearch en el puerto 9200
``brew services start elasticsearch``

### utiliza la gema 'tire' para comunicarse con Elasticsearch
``gem 'tire'``

### crear archivo config/application.yml
``
development:
 DB_HOSTNAME: "localhost"
 DB_USERNAME: "DATABASE USER"
 DB_PASSWORD: "DATABASE PASS"
 DB_NAME: "DATABASE NAME"
   ``