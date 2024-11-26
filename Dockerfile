FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /sample-app
COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
WORKDIR /sample-app
COPY --from=build /sample-app/out .
ENV ASPNETCORE_URLS=http://0.0.0.0:5000
EXPOSE 5000
ENTRYPOINT ["dotnet", "SampleWebApiAspNetCore.dll"]