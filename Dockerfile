FROM eclipse-temurin:21
WORKDIR /app
ADD https://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.5.0_Server_Java_17-21.zip /gtnh.zip
ADD https://github.com/Kiwi233/Translation-of-GTNH/releases/download/0-nightly-build%2F2024-04-03/nightly-2024-04-03.7z /translation.7z

RUN apt update &&\
    apt upgrade -y&&\
    apt install unzip p7zip-full -y &&\
    unzip -d /app /gtnh.zip > /dev/null &&\
    7z x -o/app -aoa /translation.7z &&\
    rm /gtnh.zip /translation.7z &&\
    echo "eula=true" > eula.txt

EXPOSE 25565
ENTRYPOINT ["java","-Xms6G","-Xmx6G","-Dfml.readTimeout=180","@java9args.txt","nogui"]

