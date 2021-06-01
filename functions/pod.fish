function pod -d 'ssh to pod <id>' -a podid
    if not string length -q -- $podid
        echo Please specify the pod id.
        return 1
    end
    ssh -t b13e2e-nat-vlan$podid.h4.ai "sudo su - h4qa1"
end
