FROM debian:9

RUN apt-get update
RUN apt-get install -y p7zip-full wget openjdk-8-jre
 
RUN mkdir -p ~/'runescape/oldschool' '/tmp/oldschool'
RUN wget -O '/tmp/oldschool/OldSchool.dmg' 'https://www.runescape.com/downloads/OldSchool.dmg'

RUN 7z e -o'/tmp/oldschool/OldSchool-dmg' -y '/tmp/oldschool/OldSchool.dmg'
RUN cp '/tmp/oldschool/OldSchool-dmg/jagexappletviewer.jar' ~/'runescape/oldschool/jagexappletviewer.jar'

RUN rm -Rf '/tmp/oldschool'

RUN apt-get install -y xvfb
WORKDIR /root/runescape/oldschool

CMD java -Duser.home='.' -Djava.class.path='jagexappletviewer.jar' -Dcom.jagex.config='http://oldschool.runescape.com/jav_config.ws' 'jagexappletviewer' 'oldschool'
