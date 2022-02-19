# debezium-postgres-springboot
A demo spring boot based project built to depict the usage of debezium data capture with postgres database.

## Prerequisites:
- Ensure `docker` & `docker-compose` is installed in your machine.

## Steps to run the project:
- Clone the repository.
- Run `docker-compose up` in the root directory of the project.
- This will run four containers - Kafka, Zookeeper, Postgres & Debezium Postgres Connector.
- Also, the scripts from folder `init-scripts` will be executed automatically in the running Postgres container.
- Now, run the spring boot project. (`./mvnw spring-boot:run`). This will start the server on port 8080 & automatically register a kafka consumer to the kafka cluster.
- Now, setup the debezium postgres connector by accessing `http://localhost:8080/connectors/add`. This will register a producer from postgres database to kafka cluster. The connector configuration is present in `src/main/resources/connector-config.json` file.
- Now, enter the running postgres container using `docker exec -it CONTAINER_ID_OF_POSTGRES_CONTAINER sh` .
- After entering into running postgres container, enter the postgres shell by running `psql -U postgres`.
- Now, connect to the `user_db` databse by entering `\c user_db;`.
- Now, you can make changes to the `users` table and all those changes will be consumed & printed in spring boot server logs.
- For example, enter `INSERT INTO users(name,age) values('Saaaarthak',100)` & check the spring boot server logs.
