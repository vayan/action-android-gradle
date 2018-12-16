FROM openjdk:8

LABEL version="0.1.0"
LABEL repository="https://github.com/vayan/action-gradle"
LABEL homepage="https://github.com/vayan/action-gradle"
LABEL maintainer="vayan <va@yan.pm>"

LABEL com.github.actions.name="GitHub Action for gradle"
LABEL com.github.actions.description="Wraps the gradle CLI"
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="green"

ENV ANDROID_HOME /opt/android-sdk-linux

RUN apt-get update -qq

RUN cd /opt \
    && wget -q https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O android-sdk-tools.zip \
    && unzip -q android-sdk-tools.zip -d ${ANDROID_HOME} \
    && rm android-sdk-tools.zip

ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

RUN yes | sdkmanager --licenses

RUN sdkmanager "emulator" "tools" "platform-tools"

RUN yes | sdkmanager \
    "platforms;android-28" \
    "platforms;android-27" \
    "platforms;android-26" \
    "platforms;android-25" \
    "platforms;android-24" \
    "platforms;android-23" \
    "platforms;android-22" \
    "platforms;android-21" \
    "platforms;android-19" \
    "platforms;android-17" \
    "platforms;android-15" \
    "build-tools;28.0.3" \
    "build-tools;28.0.2" \
    "build-tools;28.0.1" \
    "build-tools;28.0.0" \
    "build-tools;27.0.3" \
    "build-tools;27.0.2" \
    "build-tools;27.0.1" \
    "build-tools;27.0.0" \
    "build-tools;26.0.2" \
    "build-tools;26.0.1" \
    "build-tools;25.0.3" \
    "build-tools;24.0.3" \
    "build-tools;23.0.3" \
    "build-tools;22.0.1" \
    "build-tools;21.1.2" \
    "build-tools;19.1.0" \
    "build-tools;17.0.0" \
    "system-images;android-28;google_apis;x86" \
    "system-images;android-26;google_apis;x86" \
    "system-images;android-25;google_apis;armeabi-v7a" \
    "system-images;android-24;default;armeabi-v7a" \
    "system-images;android-22;default;armeabi-v7a" \
    "system-images;android-19;default;armeabi-v7a" \
    "extras;android;m2repository" \
    "extras;google;m2repository" \
    "extras;google;google_play_services" \
    "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2" \
    "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.1" \
    "add-ons;addon-google_apis-google-23" \
    "add-ons;addon-google_apis-google-22" \
    "add-ons;addon-google_apis-google-21"

RUN apt-get update \
  && apt-get -y install gradle \
  && gradle -v

COPY "entrypoint.sh" "/entrypoint.sh"

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
