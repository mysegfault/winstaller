
OS=`uname`
# Lowercase
OS=${OS,,}
log "OS is $OS"

IS_LINUX=
IS_DEBIAN=
IS_UBUNTU=
DISTRO_NAME=

if [ `uname` == "Linux" ]; then
    log "Is Linux!"
    IS_LINUX=1
fi

if [ $IS_LINUX ]; then
    if uname -a | grep -i "Debian" &> /dev/null; then
        IS_DEBIAN=1
        DISTRO_NAME=`cat /etc/debian_version | cut -d "/" -f1`
        # Lowercase
        DISTRO_NAME=${DISTRO_NAME,,}
        log "Is Debian ($DISTRO_NAME)"
    fi

    if uname -a | grep -i "Ubuntu" &> /dev/null; then
        log "Is Ubuntu!"
        IS_UBUNTU=1
    fi
fi

# Lowercase
case "$OS" in
        linux)
            source modules/os/linux.sh
            ;;
         
        *)
            die $"Your OS [$OS] is not supported yet." 1
esac
