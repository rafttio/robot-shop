FROM robotshop/rs-shipping:latest

RUN apt-get update && apt-get -y install maven

COPY pom.xml /opt/shipping/src/

RUN cd src && mvn dependency:resolve

CMD [ "java", "-Xmn256m", "-Xmx768m", "-jar", "shipping.jar" ]
