# ssh access to mongodb
function mgo -d "Open MongoDB shell in cluster" -a cluster instance_id
    if not string length -q -- $cluster
        echo Please specify both the instance id and cluster name.
        return 1
    end
    if string length -q -- $instance_id
        ssh -t tetter@orch-$cluster.tetrationanalytics.com "sudo su - tetinstall -c 'ssh -t mongodb-$instance_id mongo'"
    else
        ssh -t tetter@orch-$cluster.tetrationanalytics.com "sudo su - tetinstall -c 'ssh -t mongodb-1 mongo'"
    end
end
