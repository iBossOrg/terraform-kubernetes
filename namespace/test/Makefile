TF_ENV	= KUBECONFIG=kubeconfig.yaml

init: kubeconfig.yaml tf-init

kubeconfig.yaml:
	@set -ex; \
	k3d create --server-arg=--no-deploy --server-arg=traefik; \
	while ! k3d get-kubeconfig 2>/dev/null; do sleep 1; done; \
	export KUBECONFIG=$$(k3d get-kubeconfig); \
	kubectl --namespace kube-system rollout status deploy/coredns
	@ln -s $$(k3d get-kubeconfig) $@

plan: init tf-plan

apply: init tf-apply

output: init tf-output

destroy: tf-destroy tf-forget

forget: tf-forget
	@set -ex; \
	k3d delete; \
	rm -fv kubeconfig.yaml

clean: tf-clean forget

MK_DIR  ?= $(CURDIR)/../../../Mk
include $(MK_DIR)/terraform.mk
