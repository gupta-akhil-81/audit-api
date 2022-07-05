mvn clean compile assembly:single

echo =============================================================
echo BUILD PACKAGE DONE. BUILDING DOCKER IMAGE NOW.
echo =============================================================

sudo docker build -t audit-api-message-producer .

echo =============================================================
echo DOCKER IMAGE BUILD DONE. STARTING DOCKER IMAGE NOW.
echo =============================================================

sudo docker run -d -p 8080:8080 -t audit-api-message-producer

echo =============================================================
echo STARTED DOCKER IMAGE. WAIT SOME TIME. TESTING STARTING.
echo =============================================================

sleep 30s

curl -X GET http://localhost:8080/audit/v1/health

echo
echo =============================================================
echo HEALTH API CALL DONE
echo =============================================================

curl -X POST http://localhost:8080/audit/v1/entries -H "Content-Type:application/json" -d @./src/test/java/resources/audit1.json

echo
echo =============================================================
echo ADUIT API CALL DONE. STOPPING ALL CONTAINERS NOW.
echo =============================================================

sudo docker kill $(sudo docker ps -q)