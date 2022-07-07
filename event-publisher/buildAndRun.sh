mvn clean package

echo =============================================================
echo BUILD PACKAGE DONE. BUILDING DOCKER IMAGE NOW.
echo =============================================================

docker build -t audit-api-event-publisher .

echo =============================================================
echo DOCKER IMAGE BUILD DONE. STARTING DOCKER IMAGE NOW.
echo =============================================================

docker run -d -p 9090:9090 -t audit-api-event-publisher

echo =============================================================
echo STARTED DOCKER IMAGE. WAIT SOME TIME. TESTING STARTING.
echo =============================================================

sleep 30s

curl -X GET http://localhost:9090/audit/v1/health

echo
echo =============================================================
echo HEALTH API CALL DONE
echo =============================================================

curl -X POST http://localhost:9090/audit/v1/events -H "Content-Type:application/json" -d @./src/test/audit1.json

echo
echo =============================================================
echo ADUIT API CALL DONE. STOPPING ALL CONTAINERS NOW.
echo =============================================================

docker kill $(docker ps -q)
