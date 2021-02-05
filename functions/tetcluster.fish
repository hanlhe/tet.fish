function tetcluster -d "ssh to cluster orchestrator" -a cluster host
    if not string length -q -- $cluster
        echo Please specify the cluster name.
        return 1
    end
    if not string length -q -- $host
        ssh -t tetter@orch-$cluster.tetrationanalytics.com "sudo su - tetinstall"
    else
        ssh -t tetter@orch-$cluster.tetrationanalytics.com "sudo su - tetinstall -c 'ssh $host'"
    end
end
