function mdev -d "establish dev ssh tunnel to cluster" -a cluster
    if not string length -q -- $cluster
        echo Please specify the cluster name.
        return 1
    end
    ssh -N -C \
        -L 9196:1.1.1.12:9196 \
        -L 8090:druidHistoricalBroker-1:8090 \
        -L 8889:orchestrator-1:8889 \
        -L 6443:127.0.0.1:6443 \
        -L 9696:appserver-1:9696 \
        -L 7733:appserver-1:7733 \
        -L 4242:tsdbBosunGrafana-1:4242 \
        -L 8086:happobat-1:8086 \
        -L 8080:happobat-1:8080 \
        -L 8118:appserver-1:8118 \
        -L 38017:mongodb-2:27017 \
        -l tetter orch-$cluster.tetrationanalytics.com
end
