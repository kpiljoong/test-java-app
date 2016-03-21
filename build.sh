gradle clean war
cp ./build/libs/test-java-app.war ./pkg/app/ROOT.war
cd ./pkg && zip -r ../$1 ./* && cd ../

