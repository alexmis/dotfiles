#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

#https://java.christmas/2019/16
brew cask install AdoptOpenJDK/openjdk/adoptopenjdk{8,11,14}
brew install jenv

jenv doctor
#jenv enable-plugin export
#jenv enable-plugin maven

for version in 8 11 14
    do
        jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-$version.jdk/Contents/Home
done

jenv versions
