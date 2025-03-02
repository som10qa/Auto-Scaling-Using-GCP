#!/bin/bash
gcloud compute --project=securescalergcp firewall-rules create autoscale-firewall \
    --direction=INGRESS \
    --priority=1000 \
    --network=default \
    --action=ALLOW \
    --rules=PROTOCOL:PORT,... \
    --source-ranges=0.0.0.0/0 \
    --target-tags=http-server,https-server
	--description="Allow HTTP and HTTPS traffic"