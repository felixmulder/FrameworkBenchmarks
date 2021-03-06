FROM techempower/rapidoid-base:0.1

CMD java \
    -server \
    -XX:+UseNUMA \
    -XX:+UseParallelGC \
    -XX:+AggressiveOpts \
    -cp target/rapidoid-1.0-jar-with-dependencies.jar \
    lowlevel.Main \
    profiles=production
