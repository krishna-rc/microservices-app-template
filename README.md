# microservices-app-template
Template structure for building, deploying and monitoring microservices application using Docker and Kubernetes to deploy scalable and resilient applications. This project is a constant work-in-progress. As I learn of new and optimised methods to implement such microservices applications or new architectures and tools are developed, this repo will be updated.

## Tools and Technologies

- Docker
- Kubernetes
- Prometheus and Grafana

## Application

Sample application used for the template is [Piwigo](https://github.com/Piwigo/Piwigo). Piwigo is a full featured open source photo gallery application for the web. Piwigo has the following requirements:
- Apache webserver
- PHP 7.4+
- MySQL 5 or greater or MariaDB equivalent
- ImageMagick (recommended) or PHP GD
For monitoring the application services, Prometheus and Grafana are used to visualize the 

## Microservices architecture
Application consists of 2 docker images, one for the Webapp and other for the Backend database. To enable high availability of the UI and the backend database, multiple pods are used. To maintain application data across pod restarts, Persistent storage volumes are used.
There are 2 namespaces, Application namespace for deploying the Piwigo application and Infra namespace for deploying the monitoring tools, in this case Prometheus and Grafana.

## Prerequisite to run the application
- make command should be installed
- kubectl should be installed and configured to point to k8s cluster
- For each deployment env:
    Persistent storage volumes with ReadWriteMany option, accessible from all k8s node, with StorageClassName - web-storage - Used for webapp
    Persistent storage volumes with ReadWriteOnce option, accessible from all k8s node, with StorageClassName - db-storage - Used for backend  
- Docker should be installed for building images

## How to use


