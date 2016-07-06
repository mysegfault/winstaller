
VERBOSE=0
SETUPMODE=0

function echoVersion {
    grep version package.json | sed "s/  \"version\": //" | sed "s/[,\"]//g";
}

while [ "$1" != "" ]; do
    case $1 in
        -s | --setup )          SETUPMODE=1
                                ;;
        -d | --debug )          VERBOSE=1
                                ;;
        -dd | --debug-all )     VERBOSE=2
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        -v | --version )        echoVersion
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done
