;; -*- coding: utf-8 -*-
;; File: wordpress-kubernetes-post.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-02-03 15:37:45>
;; --8<-------------------------- separator ------------------------>8--
(setq list-post-meta
      ;; title-md5, post-id, post-title, blog-uri, meta-description, keywords
      '(
        ("e4266411ba86f7f83e250c1399c9b33" "12" "Test" "test"
         "" "Deep Dive Into Kubernetes")
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ("952b0c94f32a67fb197d86b7306c4a30" "25" "Kubernetes Pods" "challenges-k8s-pod"
         "" "Deep Dive Into Kubernetes")

        ("4a699d7cac6817b907a3f9198e94d200" "26" "Kubernetes CRD" "challenges-k8s-crd"
         "" "Deep Dive Into Kubernetes")

        ("4a699d7cac6817b907a3f9198e94d200" "27" "Kubernetes CRD" "challenges-k8s-crd"
         "" "Deep Dive Into Kubernetes")

        ("4a699d7cac6817b907a3f9198e94d200" "28" "Kubernetes CRD" "challenges-k8s-crd"
         "" "Deep Dive Into Kubernetes")

        ("4a699d7cac6817b907a3f9198e94d200" "29" "Kubernetes CRD" "challenges-k8s-crd"
         "" "Deep Dive Into Kubernetes")

        ("4a699d7cac6817b907a3f9198e94d200" "30" "Kubernetes CRD" "challenges-k8s-crd"
         "" "Deep Dive Into Kubernetes")

        ("4a699d7cac6817b907a3f9198e94d200" "31" "Kubernetes CRD" "challenges-k8s-crd"
         "" "Deep Dive Into Kubernetes")

        ("4a699d7cac6817b907a3f9198e94d200" "32" "Kubernetes CRD" "challenges-k8s-crd"
         "" "Deep Dive Into Kubernetes")

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ("022ea9eb4d6919b0b0b73c167d1c0083" "24" "Kubernetes Federation" "challenges-k8s-federation"
         "" "Deep Dive Into Kubernetes")

        ("8ed7dcd85f963f6437952ecd59f68d93" "23" "GCP CheatSheet" "cheatsheet-gcp"
         "" "Deep Dive Into Kubernetes")

        ("ea9592c730504707e5aa17b425da0a7a" "13" "Docker CheatSheet" "cheatsheet-docker"
         "" "Deep Dive Into Kubernetes")

        ("08d1db0d3d67cff9c59122c9184e6f2e" "14" "Kubernetes CheatSheet" "cheatsheet-kubernetes"
         "" "Deep Dive Into Kubernetes")

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ("5c313694a780e6e70c04e02c581d855c" "21" "Kubernetes Integration Test" "challenges-k8s-test"
         "" "Deep Dive Into Kubernetes")

        ("14472c144af94c42ebf3805140710822" "22" "Kubernetes Scheduling" "challenges-k8s-schedule"
         "" "Deep Dive Into Kubernetes")

        ("825965ec4cc13d264d22462c8fbe5fa7" "19" "Deep Dive Into Kubernetes Source Code" "challenges-k8s-sourcecode"
         "" "Deep Dive Into Kubernetes")

        ("1a8c2508353cc71cc71b5240afd662a9" "20" "Kubernetes Failures & Trouble Shooting" "challenges-k8s-failure"
         "" "Deep Dive Into Kubernetes")

        ("668c56143973ec237ad176c2f70fb4c1" "15" "Prepare K8S CKA Exam" "prepare-k8s-cka"
         "" "Deep Dive Into Kubernetes")

        ("c4f48fcb2e67eb5592f803db885d0754" "16" "Kubernetes Scripts" "kubernets-scripts"
         "" "Deep Dive Into Kubernetes")

        ("1590ae2f2eaf8ea064d7cf78b4df4570" "17" "Kubernetes Networking" "challenges-k8s-networking"
         "" "Deep Dive Into Kubernetes")

        ("86d6c56a2439836a6d6e0ebafbfc4e5e" "18" "Kubernetes Storage" "challenges-k8s-storage"
         "" "Deep Dive Into Kubernetes")

        ("4f099759595b551321bc35b527abba0a" "9" "Kubernetes Logging" "challenges-k8s-logging"
         "" "Deep Dive Into Kubernetes")

        ("7c8b89534fdca56f69d4104f833edddc" "10" "Kubernetes Istio" "challenges-k8s-isto"
         "" "Deep Dive Into Kubernetes")

        ("46e42d84c9507e6500ad55ba575af909" "11" "Kubernetes Monitoring" "challenges-k8s-monitoring"
         "" "Deep Dive Into Kubernetes")

        ("fe940d651b97e36375bf4066262add14" "5" "Kubernetes CRD" "challenges-k8s-crd"
         "" "Deep Dive Into Kubernetes")

        ))

(setq xml-rpc-allow-unicode-string nil)

(setq mywordpress-server-url "https://kubernetes.dennyzhang.com"
      mywordpress-updatemeta-url ""
      mywordpress-username "denny"
      BlOG-TAG "BLOG"
      POST-TAIL (concat "Connect with Denny In <a href='https://linkedin.com/in/dennyzhang001'>LinkedIn</a> Or <a href='mailto: contact@dennyzhang.com'>Mail</a>" google-adsense)
      ORG-CSS-FILE "https://cdn.dennyzhang.com/css/org-kubernetes.css"
      mywordpress-pwd "sophiaMark678")
