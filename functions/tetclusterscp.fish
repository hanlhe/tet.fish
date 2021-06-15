function tetclusterscp -d "ssh to cluster orchestrator" -a cluster file host
    if not string length -q -- $cluster
        echo Please specify the cluster name.
        return 1
    end
    if not string length -q -- $file
        echo Please specify the file.
        return 1
    end
    set filename (string split -- / $file)[-1]
    scp $file tetter@orch-$cluster.tetrationanalytics.com:/tmp/
    if string length -q -- $host
        ssh -t tetter@orch-$cluster.tetrationanalytics.com "sudo su - tetinstall -c 'scp /tmp/$filename $host:/tmp'"
    end
end
