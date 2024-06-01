# Etapa de construção
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app

# Copie o arquivo pom.xml e as dependências para o cache de build
COPY pom.xml .
RUN mvn dependency:go-offline

# Copie o código fonte e construa o aplicativo
COPY src ./src
RUN mvn package -DskipTests

# Etapa de produção
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copie o arquivo JAR construído da etapa anterior
COPY --from=build /app/target/consulta-cpf-0.0.1-SNAPSHOT.jar app.jar

# Exponha a porta que a aplicação usará
EXPOSE 8080

# Execute a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]