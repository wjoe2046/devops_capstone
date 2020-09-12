kops create cluster \
--state=${KOPS_STATE_STORE} \
--node-count=2 \
--master-size=t2.micro \
--node-size=t2.micro \
--zones=us-west-2b \
--name=${KOPS_CLUSTER_NAME} \
--dns private \
--master-count 1
