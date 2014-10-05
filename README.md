# Supported tags and `Dockerfile` links

# What is Mono

Mono is a free and open source project led by Xamarin (formerly by Novell and originally by Ximian) to create an Ecma standard-compliant, .NET Framework-compatible set of tools including, among others, a C# compiler and a Common Language Runtime.

* [http://en.wikipedia.org/wiki/Mono_(software)](http://en.wikipedia.org/wiki/Mono_(software))
* [http://www.mono-project.com/](http://www.mono-project.com/)

![logo](https://github.com/friism/docker-mono/raw/master/logo.png)

# How to use this image

This image will run stand-alone Mono console apps. No web server (such as [XSP](http://en.wikipedia.org/wiki/XSP_(software))) is included.

## Create a `Dockerfile` in your Mono app project

This example Dockerfile will run an executable called `TestingConsoleApp.exe`.

    FROM friism/mono:3.8.0-onbuild
	CMD [ "mono",  "./TestingConsoleApp.exe" ]

Place this file in the root of your app, next to the `.sln` solution file. Modify the exectuable name to match what you want to run.

This image includes `ONBUILD` triggers that adds your app source code to `/usr/src/app/source`, restores NuGet packages and compiles the app, placing the output in `/usr/src/app/build`.

With the Dockerfile in place, you can build and run a Docker image with your app:

    docker build -t my-app .
    docker run my-app

You should see any output from your app now.

# Contribute

This Docker image is not a product of the Mono Project. It's currently maintained by [Michael Friis](http://friism.com/). Contributions are welcome.

# Issues

Please report issues on the [GitHub project](https://github.com/friism/docker-mono).

# License

This Docker Image is licensed with the Expat License. See the [Mono Project licensing FAQ](http://www.mono-project.com/docs/faq/licensing/) for details on how Mono and associated libraries are licensed.