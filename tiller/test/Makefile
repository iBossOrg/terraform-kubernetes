init: kubeconfig.yaml tf-init

kubeconfig.yaml:
	@set -ex; \
	k3d create --name=tf-helm --server-arg=--no-deploy --server-arg=traefik; \
	while ! k3d get-kubeconfig --name=tf-helm 2>/dev/null; do sleep 1; done; \
	export KUBECONFIG=$$(k3d get-kubeconfig --name=tf-helm); \
	kubectl --namespace kube-system rollout status deploy/coredns
	@ln -s $$(k3d get-kubeconfig --name=tf-helm) $@

plan: init tf-plan

apply: init tf-apply

output: init tf-output

destroy: tf-destroy tf-forget

forget: tf-forget
	@set -ex; \
	k3d delete --name=tf-helm; \
	rm -fv kubeconfig.yaml

clean: tf-clean forget

MK_DIR  ?= $(CURDIR)/../../../Mk
include $(MK_DIR)/terraform.mk
