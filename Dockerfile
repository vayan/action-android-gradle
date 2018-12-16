FROM bitriseio/docker-android:latest

LABEL version="1.0.0"
LABEL repository="https://github.com/vayan/action-gradle"
LABEL homepage="https://github.com/vayan/action-gradle"
LABEL maintainer="vayan <va@yan.pm>"

LABEL com.github.actions.name="GitHub Action for building Android app with Gradle"
LABEL com.github.actions.description="Wraps the gradle CLI with Android Tools pre-installed"
LABEL com.github.actions.icon="play"
LABEL com.github.actions.color="green"

COPY "entrypoint.sh" "/entrypoint.sh"

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
