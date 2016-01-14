#!/bin/sh
export APP=act
export HOST=192.168.33.11
export PORT1=10001
export PORT2=10002
export PORT3=10003
export PORT4=10004
export ROMA_DIR=/usr/local/roma/ROMA
export APP_DIR=/usr/local/roma/apps/${APP}
rm logs/*
echo "* removed log file"
rm -r routing/*
echo "* removed routing file"
rm -rf ds/*
echo "* removed ds file"

echo "=====start to make ROMA cluster===="
#####single server#####################################################################################
### instance=>3 / rn=>2
cp -i routing.org_single/* routing/
cd /usr/local/roma/ROMA/
export HOST=localhost
bin/romad ${HOST} -p ${PORT1} -d --config /usr/local/roma/apps/${APP}/config.rb --replication_in_host
bin/romad ${HOST} -p ${PORT2} -d --config /usr/local/roma/apps/${APP}/config.rb --replication_in_host
bin/romad ${HOST} -p ${PORT3} -d --config /usr/local/roma/apps/${APP}/config.rb --replication_in_host


#####multi server######################################################################################
### instance => 2 / rn=>2
#cp -r routing.org_multi_node2_rn2/* routing/
#cd /usr/local/roma/ROMA/
#bin/romad ${HOST} -p ${PORT1} -d --config /usr/local/roma/apps/${APP}/config.rb
#bin/romad ${HOST} -p ${PORT2} -d --config /usr/local/roma/apps/${APP}/config.rb

### instance => 2 / rn=>3
#cp -r routing.org_multi_node2_rn3/* routing/
#cd /usr/local/roma/ROMA/
#bin/romad ${HOST} -p ${PORT1} -d --config /usr/local/roma/apps/${APP}/config.rb
#bin/romad ${HOST} -p ${PORT2} -d --config /usr/local/roma/apps/${APP}/config.rb
######################################################################################################
echo "=====complete to make ROMA cluster and booting...===="
sleep 3
telnet localhost ${PORT1}
