title Make Compilation

del *.class /s


set CLASSPATH=.;%CLASSPATH%;
set CLASSPATH=%CLASSPATH%;..\..\..\..\lib\servlet-api.jar;
set CLASSPATH=%CLASSPATH%;..\..\..\..\lib\org.apache.sling.commons.json-2.0.2-incubator.jar;


"%JDK_PATH%"\javac -J-Xss2m MakeClasses\*.java
pause