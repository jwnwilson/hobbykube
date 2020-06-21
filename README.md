# Kubernetes cluster setup automation

This project is a modified version of https://github.com/hobby-kube/provisioning, using scaleway cloud provider, at time of writing these terraform commands can build a kubernetes cluster from scratch manually.

Some changes I had to make and problems I noticed:

- The firewalling using wireguard does not compile correctly except with much older versions of ubuntu, I saw comments of it working with ubuntu 14.04 but as this is an older LTS version but updated to focal 20.04 and updated the scripts to fix this.

- I also had problems with weave which this setup uses for dns routing in the cluster and that didn't compile correctly so I switched to flannel which worked a charm

- I also had to update ufw rules to allow more subnet ports as it was configured for weave origionally, I would assume this isn't secure and would need to be updated.

- I added ceph-common to the dependancies which is required for persistant volumes creation using rook.

In the end this created a working cluster but when I installed rook it was missing a module "rdb" which should have been installed by the package ceph-common but however seems to be missing in more modern versions of the package. The solution I found was to manually re-compile this module and I decided to look to alternatives.

So I've decided to move to managed cluster so I can focus on the applications over the cluster management. 