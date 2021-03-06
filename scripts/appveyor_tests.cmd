@ECHO OFF

:: Run unit tests 
cd test\Steeltoe.Common.Test
dotnet restore --configfile ..\..\nuget.config
dotnet xunit -verbose
if not "%errorlevel%"=="0" goto failure
cd ..\..

cd test\Steeltoe.Common.Http.Test
dotnet restore --configfile ..\..\nuget.config
dotnet xunit -verbose 
if not "%errorlevel%"=="0" goto failure
cd ..\..

cd test\Steeltoe.Common.Autofac.Test
dotnet restore --configfile ..\..\nuget.config
dotnet xunit -verbose
if not "%errorlevel%"=="0" goto failure
cd ..\..

echo Unit Tests Pass
goto success
:failure
echo Unit Tests Failure
exit -1
:success