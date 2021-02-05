# ssh access to mongodb
function pmr -d "Query PMR status" -a user_id
    if not string length -q -- $user_id
        set user_id hanlhe
    end
    set --local user_filter "select(.userid | contains(\"$user_id\"))"
    set --local pending_version "pending.$user_id.build         "
    curl -s http://anvil.tetrationanalytics.com/v1/builderfarm/buildrpm/status |
    jq -r '.response 
    | .[] 
    | '{$user_filter}'
    | "http://anvil.tetrationanalytics.com/buildstatus#" + .jobid + " | " +
        if .status.job_status == 50 then    "Submitted "
        elif .status.job_status == 100 then "Running   "
        elif .status.job_status == 150 then "CancelReq "
        elif .status.job_status == 200 then "Cancelled "
        elif .status.job_status == 250 then "Failed    "
        elif .status.job_status == 275 then "Aborted   "
        elif .status.job_status == 300 then "Successful"
        else                                "Unknown   " end
        + " | " + 
        if .image_version then .image_version
        else "'$pending_version'" end
        + " | " + .pr_url'
end
