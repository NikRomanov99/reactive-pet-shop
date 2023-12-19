FROM gradle:jdk17 as builder
WORKDIR /erp-team-task-project
COPY src ./src
COPY build.gradle ./build.gradle
RUN gradle clean build

FROM openjdk:17-alpine as petshop
WORKDIR /root
COPY --from=builder /erp-team-task-project/build/libs/* ./app
ENTRYPOINT ["java", "-jar", "/root/app"]