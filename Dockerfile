FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
EXPOSE 80
EXPOSE 5001/tcp
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy everything else and build app
COPY ../ ./

RUN dotnet restore "DoZero.csproj" --disable-parallel
ENV PATH="${PATH}:/root/.dotnet/tools"
RUN dotnet publish -c Release -o out

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "DoZero.dll"]
