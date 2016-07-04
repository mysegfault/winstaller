
OS=`uname`

if [ "$VERBOSE" = "1" ]; then
	echo "OS is $OS"
fi

# Lowercase
case "${OS,}" in
        linux)
            source modules/os/linux.sh
            ;;
         
        *)
            echo $"Your OS [$OS] is not supported yet."
            exit 1
 
esac
