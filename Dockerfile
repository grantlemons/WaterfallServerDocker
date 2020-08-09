# escape=`

FROM openjdk:8-alpine

LABEL name='Waterfall Server' author='Grant Lemons'

WORKDIR /home/waterfall

RUN addgroup -g 1000 waterfall `
&& adduser -Ss /bin/false -u 1000 -G waterfall -h /home/waterfall waterfall `
&& mkdir -m 777 /data `
&& chown waterfall:waterfall /data /home/waterfall `
&& wget -O "latest.jar" https://papermc.io/ci/job/Waterfall/lastStableBuild/artifact/Waterfall-Proxy/bootstrap/target/Waterfall.jar

EXPOSE 25565

COPY ./data/ /home/waterfall/

RUN chmod 700 /home/waterfall/startup.sh

CMD ./startup.sh