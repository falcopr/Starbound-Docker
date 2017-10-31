$SCRIPTDIR = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$SCRIPTDIR = "/" + (($SCRIPTDIR -replace "\\", "/") -replace ":", "").Trim("/")
$DRIVELETTER = ($SCRIPTDIR -replace "^/(.*?)/(.*?)$", '/$1/').ToLower()
$RESULTINGUNIXSCRIPTDIR = ($DRIVELETTER + ($SCRIPTDIR -replace "^/(.*?)/(.*?)$", '$2'))

docker volume create starbound

docker run -it --name starbound `
    --mount "source=starbound,target=/starbound/data" `
    -p 21025:21025 -p 21025:21025/udp -p 21026:21026 -p 21026:21026/udp `
    -e "STEAM_USERNAME=enter_username" -e "STEAM_PASSWORD=enter_password" `
    falcoprescher/starbound:1.0
