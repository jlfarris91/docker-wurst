FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN net user /add wurstuser
USER wurstuser
WORKDIR /users/wurstuser

RUN wget https://grill.wurstlang.org/hudson/job/WurstSetup/143/artifact/downloads/WurstSetup.jar
RUN java -jar WurstSetup.jar install wurstscript

ENV PATH="/users/wurstuser/.wurst/:${PATH}"
RUN icacls /users/wurstuser/.wurst/grill /grant wurstuser:(f,wdac)
