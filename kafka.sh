docker pull wurstmeister/zookeeper
docker pull wurstmeister/kafka

docker-compose -f docker-compose.yml up -d


docker exec -it kafka /bin/sh

cd /opt/kafka_2.13-2.8.1/bin

kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic audit-events-topic

kafka-topics.sh --list --zookeeper zookeeper:2181