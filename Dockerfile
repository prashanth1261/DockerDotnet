FROM mcr.microsoft.com/dotnet/sdk:3.1

WORKDIR /src/app

EXPOSE 80

COPY . .

RUN dotnet restore

RUN dotnet build

RUN dotnet publish -c release -o /src/app/releaseartifacts

WORKDIR /src/app/releaseartifacts

ENV ASPNETCORE_URLS="http://*:5000"

EXPOSE 5000

ENTRYPOINT [ "dotnet","DockerDotnet.dll"]
