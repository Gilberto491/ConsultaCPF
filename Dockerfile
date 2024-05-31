# Use uma imagem base do JDK
FROM openjdk:17-jdk-slim

# Adicione um argumento para definir o arquivo JAR
ARG JAR_FILE=target/consulta-cpf-0.0.1-SNAPSHOT.jar

# Copie o arquivo JAR para o contêiner
COPY ${JAR_FILE} app.jar

# Exponha a porta que a aplicação usará
EXPOSE 8080

# Execute a aplicação
ENTRYPOINT ["java", "-jar", "/app.jar"]