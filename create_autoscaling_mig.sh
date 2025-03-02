gcloud beta compute instance-groups managed create autoscale-instance-group-1 \
    --project=securescalergcp \
    --base-instance-name=autoscale-instance-group-1 \
    --template=projects/securescalergcp/regions/us-central1/instanceTemplates/autoscle-instance-template \
    --size=1 \
    --zone=us-central1-c \
    --default-action-on-vm-failure=repair \
    --no-force-update-on-repair \
    --standby-policy-mode=manual \
    --list-managed-instances-results=pageless \
&& \
gcloud beta compute instance-groups managed set-autoscaling autoscale-instance-group-1 \
    --project=securescalergcp \
    --zone=us-central1-c \
    --mode=on \
    --min-num-replicas=1 \
    --max-num-replicas=5 \
    --target-cpu-utilization=0.6 \
    --cpu-utilization-predictive-method=optimize-availability \
    --cool-down-period=60