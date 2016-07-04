
VERBOSE=0

while [ "$1" != "" ]; do
    case $1 in
        -v | --verbose )        VERBOSE=1
                                ;;
        -vv )                   VERBOSE=2
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done
