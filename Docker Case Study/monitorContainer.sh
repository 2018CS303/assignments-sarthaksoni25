echo -n "Enter container name that has to be monitored: "
read name
docker logs -f $name
