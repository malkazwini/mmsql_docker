#!/bin/bash

set -e

while [[ $# -gt 1 ]]
do
    INPUT="$1"
    case $INPUT in
        -h|--host)
            DbHost="$2"
            shift
            ;;
        -p|--port)
            DbPort="$2"
            shift
            ;;
        -u|--user)
            DbUser="$2"
            shift
            ;;
        -pwd|--password)
            DbPassword="$2"
            shift
            ;;
        -db|--database)
            DbName="$2"
            shift
            ;;
        -m|--mode)
            # [dropDb|alterDb]
            DbMode="$2"
            shift
            ;;
        -d|--debug)
            debug="$2"
            if [[ $debug == "true" ]]; then set -x; fi
            shift
            ;;
        * )
            do_help
            ;;
    esac
    shift
done

do_help(){
    echo "Please provide --host [host] --port [port#] --user  --debug [true|false] --mode [dropDb|alterDb]"
}



drop_database(){
    /opt/mssql-tools/bin/sqlcmd -E -S tcp:"${DbHost}","${DbPort}" -U "${DbUser}" -P "${DbPassword}" -Q "DROP DATABASE ${DbName}"
}
alterDb(){
    echo "Work in progreess!"
}



case $mode in
    dropDb )
        drop_database
    ;;
    alterDb )
        alter_database
        ;;
    *)
        ;;
esac

