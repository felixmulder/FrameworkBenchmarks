FROM techempower/maven:0.1

ADD ./ /dropwizard
WORKDIR /dropwizard
RUN mvn clean package -P mongo
CMD java -jar target/hello-world-0.0.1-SNAPSHOT.jar server hello-world-mongo.yml
