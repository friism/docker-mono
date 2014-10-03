FROM ubuntu:14.04
RUN apt-get update && apt-get install -y \
		bzip2 \
		curl \
		gcc \
		g++ \
		make \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/src/mono
WORKDIR /usr/src/mono

ENV MONO_VERSION 3.8.0

RUN curl -SL "http://download.mono-project.com/sources/mono/mono-$MONO_VERSION.tar.bz2" \
	| tar -xj --strip-components=1
RUN ./configure \
		--enable-minimal=aot,profiler,debug,logging \
		--disable-boehm \
		--disable-libraries \
		--disable-moonlight \
		--disable-nls \
		--with-mcs-docs=no \
	&& make monolite_url=http://storage.bos.xamarin.com/mono-dist-master/latest/monolite-111-latest.tar.gz get-monolite-latest \
	&& make EXTERNAL_MCS="{$PWD}/mcs/class/lib/monolite/gmcs.exe" \
	&& make install \
	&& make clean
RUN rm -rf /usr/src/mono

RUN mozroots --import --sync --quiet

WORKDIR /
CMD ["csharp"]

