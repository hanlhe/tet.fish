# Host naming convention: 
# B13<1 char OS><6 chars for release/version><3 digit pod><2 digit host num for that OS> 
# i.e. 
# B13C00007500600 -> C: centos, 000075: version 7.5, 701: pod006, 00: 1st host for centos7.5 
# B13C00007500601 -> C: centos, 000075: version 7.5, 701: pod006, 01: 2nd host for centos7.5 
# B13R00008000600 -> R: rhel, 000075: version 8.0, 727: pod006, 00: 1st host for rhel8 
# B13W2K12R200600 -> W: Win,  version: 2012 R2: 727: pod006, 00: 1st host for win2k12R2 
function podhost -d 'ssh to pod host <host name>' -a podhostname
    if test (string length $podhostname) != 15
        echo Please specify the correct pod host name.
        return 1
    end
    set --local podid (string sub -s 11 -l 3 $podhostname)
    ssh -t b13e2e-nat-vlan$podid.h4.ai "sudo su - h4qa1 -c 'ssh -t -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -o ServerAliveCountMax=3 $podhostname'"
end
