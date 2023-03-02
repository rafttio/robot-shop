#!/usr/bin/env bash

apt-get update && apt-get -y install maven
cd src
mvn dependency:resolve
mvn package
cp target/shipping-1.0.jar ../shipping.jar
