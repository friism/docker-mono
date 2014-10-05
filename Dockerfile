FROM debian:wheezy
MAINTAINER Michael Friis <friism@gmail.com>

RUN apt-get update && apt-get install -y \
		curl \
		udev

ENV MONO_VERSION 3.10.0

RUN curl http://download.mono-project.com/repo/xamarin.gpg -o xamarin.gpg \
	&& apt-key add xamarin.gpg \
	&& echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list \
	&& apt-get update \
	&& apt-get install -y mono-devel=$MONO_VERSION-0xamarin1

RUN rm -rf /var/lib/apt/lists/*

RUN mozroots --import --sync --quiet

CMD ["csharp"]

