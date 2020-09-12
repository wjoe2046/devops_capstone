kops create cluster \
--state=${KOPS_STATE_STORE} \
--node-count=2 \
--master-size=t2.micro \
--node-size=t2.micro \
--zones=us-west-2b \
--name=${KOPS_CLUSTER_NAME} \
--dns private \
--master-count 1

#  * validate cluster: kops validate cluster --wait 10m
#  * list nodes: kubectl get nodes --show-labels
#  * ssh to the master: ssh -i ~/.ssh/id_rsa ubuntu@api.capstone.k8s.io
#  * the ubuntu user is specific to Ubuntu. If not using Ubuntu please use the appropriate user based on your OS.
#  * read about installing addons at: https://kops.sigs.k8s.io/operations/addons.