from debian:latest

 

RUN apt-get update && \

  apt-get install -y wget

 

RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

RUN dpkg -i packages-microsoft-prod.deb

 

RUN apt-get update && \

  apt-get install -y dotnet-sdk-6.0

 

WORKDIR backend-svr

 

COPY ./ ./

 

RUN dotnet restore

 

RUN dotnet build

 

EXPOSE 5000:5000

 

CMD [ "dotnet", "run" ]
