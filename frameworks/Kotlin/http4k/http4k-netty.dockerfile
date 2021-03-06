FROM techempower/java:0.1
FROM techempower/gradle:0.1

ADD ./ /http4k
WORKDIR /http4k
RUN gradle clean build netty:uber
CMD java \
    -server \
    -XX:+UseNUMA \
    -XX:+UseParallelGC \
    -XX:+AggressiveOpts \
    -XX:+AlwaysPreTouch \
    -jar netty/build/libs/http4k-netty-benchmark.jar
