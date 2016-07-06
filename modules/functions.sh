
# Error codes
ERR_MISSING_SOURCE_CONFIG=501

function log {
    if [ "$VERBOSE" = "1" ]; then
        echo $1
    fi
    if [ "$VERBOSE" = "2" ]; then
        echo $1
    fi
}

function debug {
    if [ "$VERBOSE" = "2" ]; then
        echo $1
    fi
}

# die "Error in abc" 500
function die {
    echo $1
    if [ "$VERBOSE" = "1" ]; then
        echo "Exiting with code $2"
    fi
    exit $2
}
