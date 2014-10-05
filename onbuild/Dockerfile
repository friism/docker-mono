FROM friism/mono:3.10.0
MAINTAINER Michael Friis <friism@gmail.com>

RUN mkdir -p /usr/src/app/{source,build}
WORKDIR /usr/src/app/source

RUN curl -OLS http://nuget.org/nuget.exe

ONBUILD ADD . /usr/src/app/source
ONBUILD RUN mono nuget.exe restore -NonInteractive
ONBUILD RUN xbuild /property:Configuration=Release /property:OutDir=/usr/src/app/build/
ONBUILD RUN rm -rf /usr/src/app/source
ONBUILD WORKDIR /usr/src/app/build

