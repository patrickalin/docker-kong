#!/bin/bash

SERVICE="$(basename `pwd` | cut -d'-' -f 2)"
IMAGE="$SERVICE-image"

OPTION=$(whiptail --title $SERVICE --menu "Choose your option" 15 60 4 \
"1" "Build $SERVICE" \
"2" "(Re)Start service $SERVICE" \
"3" "Stop service $SERVICE" 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Your chosen option:" $OPTION
else
    echo "You chose Cancel."
fi

case "$OPTION" in

1)  cd $IMAGE
    docker build -t $IMAGE .
    ;;
2)  docker stack remove  $SERVICE
    sleep 3
    docker stack deploy --compose-file docker-compose.yml $SERVICE
    ;;
3)  docker stack remove  $SERVICE
    ;;
esac
