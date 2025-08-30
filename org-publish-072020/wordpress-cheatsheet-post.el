;; -*- coding: utf-8 -*-
;; File: wordpress-cheatsheet-post.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-06-21 15:44:46>
;; --8<-------------------------- separator ------------------------>8--
(setq list-post-meta
      ;; title-md5, post-id, post-title, blog-uri, meta-description, keywords
      '(
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ("771e6da74a8f5e787073cd8d118XXXX" "5194" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5196" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5200" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5202" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5204" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5206" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5208" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5210" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5212" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5214" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5216" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5218" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5220" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5224" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5226" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5228" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5230" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ("771e6da74a8f5e787073cd8d118XXXX" "5232" "Cheatsheet: TEST" "cheatsheet-test-A4"
         "" "Free CheatSheet")

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ("45ed5ceed5412a36c7c7fc35c10dba31" "5192" "CheatSheet: Managing Feedback" "cheatsheet-feedback-A4"
         "Managing Feedback" "Free CheatSheet")

        ("28bfd02d2e12de5814043c0b70c03604" "5190" "CheatSheet: Work From Home" "cheatsheet-wfh-A4"
         "Work From Home" "Free CheatSheet")

        ("d880fb580eea19a330fcdf6b582a8d7c" "5188" "Python Free CheatSheet" "cheatsheet-python-A4"
         "Python Free CheatSheet" "python Free CheatSheet")


        ("133cb75598a2b24a1f5b13e4d804c02a" "4990" "CheatSheet: Managing Bias" "cheatsheet-bias-A4"
         "" "Free Bias CheatSheet")

        ("370857f7cc86f3ab9c0dd843ca51dcea" "5186" "CheatSheet: Yum/Dnf/CentOS" "cheatsheet-yum-A4"
         "" "Free Yum CentOS CheatSheet")

        ("6276423075fc89b12ce4084db1b7da06" "5184" "Cheatsheet: Chef Automation" "cheatsheet-chef-A4"
         "" "Free CheatSheet")

        ("ba5748fd6ad7dda2b2a881b6df052bb3" "42" "Cheatsheet: Google Chrome" "cheatsheet-chrome-A4"
         "" "Free Google Chrome CheatSheet")

        ("752fe69ccdea84c6c8863e50bd725d06" "5182" "Cheatsheet: Visual Studio" "cheatsheet-visualstudio-A4"
         "" "Visual Studio CheatSheet")

        ("1a1781321b14517735f411eb334330c9" "1370" "Cheatsheet: Performance Numbers For Software Engineers" "cheatsheet-performancenumber-A4"
         "" "Performance Numbers Software Engineer CheatSheet")

        ("7b72bd37f190073fed326f7f6a9da5cd" "5180" "CheatSheet: Common Code Problems & Follow-ups" "cheatsheet-followup-A4"
         "" "Free LeetCode Lintcode CheatSheet")

        ("5f445c34804aed944211965002c73aab" "5178" "Cheatsheet: Concurrency & Parallel Programming" "cheatsheet-concurrency-A4"
         "" "Free Concurrency & Parallel Programming CheatSheet")

        ("64324a8cbe3468c0d09cd979184992fa" "5176" "Cheatsheet: IP Virtual Service - IPVS" "cheatsheet-ipvs-A4"
         "" "Free IP Virtual Service - IPVS CheatSheet")

        ("0fb5b25ffaa0e70588d01a5990861d33" "5162" "Cheatsheet: Linux Internals" "cheatsheet-linuxinternals-A4"
         "" "SRE DevOps Sysadmin CheatSheet")

        ("015bc5ad9d4df717488bbd800434bf1c" "69" "CheatSheet: Nginx Web Server" "cheatsheet-nginx-A4"
         "" "Nginx Web Server CheatSheet")

        ("95c35b28a4994e8eb55d926dd7091480" "5166" "Linux Signal CheatSheet" "cheatsheet-signal-A4"
         "" "Linux Signal Free CheatSheet")

        ("853bfb5e348a291ee7509a5b2e5a9e7c" "5172" "Nano Editor CheatSheet" "cheatsheet-nano-A4"
         "Nano Cheatsheet" "nano linx Free CheatSheet")

        ("6f0ecb1d97bf9f6368a2c7f3dd38a393" "5170" "Markdown Cheatsheet" "cheatsheet-markdown-A4"
         "" "Programming Free CheatSheet")

        ("0d30bd4d2a1dc0ea02587578ba272e71" "5248" "CheatSheet: SQL & MySql" "cheatsheet-mysql-A4"
         "" "SQL MySql Free CheatSheet")

        ("f85a1bc9e3d124eb83cf5b0fe238e4b7" "5150" "Cheatsheet: Kubernetes E2E Tests" "cheatsheet-k8s-e2e-A4"
         "" "Free Kubernetes E2E Tests CheatSheet")

        ("8fcd8b319176d124863c5441fc7db47a" "5158" "Cheatsheet: Systemd/Systemctl" "cheatsheet-systemd-A4"
         "" "Free Systemd Systemctl CheatSheet")

        ("327f2926ee75a9d941b0d53065ec3a60" "5156" "CheatSheet: Concourse" "cheatsheet-concourse-A4"
         "" "concourse CI Free CheatSheet")

        ("3ee8eca163df17ed2b40dcf2077ebace" "5160" "Cheatsheet: Gym & Fitness" "cheatsheet-gym-A4"
         "" "CheatSheet Gym & Fitness")

        ("8b0fd2e72f3f9c19759a3efe3e5c6bc8" "5244" "Cheatsheet: DevOps & Software Development Life Cycle" "cheatsheet-DevOps-A4"
         "" "Free CheatSheet")

        ("5a8475dc5f6378816a05f0f7a73fa9d4" "5137" "CheatSheet: Perforce Source Code" "cheatsheet-perforce-A4"
         "" "Free Perforce CheatSheet")

        ("8d68e998cb527b2c984641395f6cb391" "5137" "Cheatsheet: Vagrant" "cheatsheet-vagrant-A4"
         "" "Vagrant Free CheatSheet")

        ("9899da7a75302a09b079e9734cf2e5ff" "4957" "Cheatsheet: Maintain A House In US" "cheatsheet-house-A4"
         "" "House Free CheatSheet")

        ("75adaccc75d1d7ff15893456761c5517" "1364" "Makefile Cheatsheet" "cheatsheet-makefile-A4"
         "" "Programming Free CheatSheet")

        ("5cbd5b60aa0f63bb6cd7d7e39568a8c0" "5147" "Cheatsheet: Kubernetes Kind" "cheatsheet-kind-A4"
         "" "Kubernetes Kind Free CheatSheet")

        ("fdbcc0d669696dbac24110cd75827007" "4973" "Nagios Cheatsheet" "cheatsheet-nagios-A4"
         "" "Nagios Monitoring Free CheatSheet")

        ("51da20c775c33289b5b0cadcbf34b6a1" "1376" "Cheatsheet: Outlook" "cheatsheet-outlook-A4"
         "" "Free Outlook CheatSheet")

        ("dad4765010e5a4453c205a200551f8af" "4985" "Cheatsheet: Linux Networking" "cheatsheet-networking-A4"
         "" "Networking Free CheatSheet")

        ("69b993bcef637bc8949b21087bb3bd4f" "2433" "Cheatsheet: Amazon Alexa/Echo" "cheatsheet-alexa-A4"
         "" "Alexa Free CheatSheet")

        ("cca0862695075f67e4d738d29b47a3c0" "4980" "Cheatsheet: VMware Products" "cheatsheet-vmware-A4"
         "" "Programming Free CheatSheet")

        ("53e0048984b44250d02855b76fc73d65" "5240" "Golang CheatSheet" "cheatsheet-golang-A4"
         "Golang CheatSheet" "golang google Free CheatSheet")

        ("a8fb3c760ccb45bd0720483492bb6d4c" "2431" "Cheatsheet: Portworx" "cheatsheet-portworx-A4"
         "" "portworx disk Free CheatSheet")

        ("5002e2cc866dd4cc2b3b1ce2d0c3f39c" "1363" "Cheatsheet: VMware vRealize Log Insight" "cheatsheet-vrli-A4"
         "" "VMware vRealize Log Insight Free CheatSheet")

        ("2b3f26158810fb02827a6d420e6048eb" "4968" "Cheatsheet: IT Document Template" "cheatsheet-doc-A4"
         "" "Free CheatSheet")

        ("b5b8409fc3fddc1f7fc3df0f530f3715" "49" "Cheatsheet: Backyard Gardening"
         "cheatsheet-garden-A4" "" "Backyard Vegetables Fruits Free CheatSheet")

        ("d6c2d5b456df02ada11389d16d03786f" "4953" "Cheatsheet: Latex" "cheatsheet-latex-A4"
         "" "Latex Free CheatSheet")

        ("d0a9edefdd03a9bbd96a60c0dd32323f" "4955" "Mac Cheatsheet" "cheatsheet-mac-A4"
         "" "mac devkit Free CheatSheet")

        ("2fdac3383760959d76ff0bf157c221b9" "5242" "CheatSheet: Linux Files" "cheatsheet-file-A4"
         "" "Programming Free CheatSheet")

        ("be6e9bb5e40b09eab3413282018e483f" "1372" "Cheatsheet: VMware Nimbus" "cheatsheet-nimbus-A4"
         "" "VMware Nimbus Free CheatSheet")

        ("33a4d76a594b23e942c517ccbacf6c9d" "4978" "Cheatsheet: Linux Disk" "cheatsheet-disk-A4"
         "" "Disk Linux Free CheatSheet")

        ("08d1db0d3d67cff9c59122c9184e6f2e" "5260" "Kubectl Kubernetes Free CheatSheet" "cheatsheet-kubernetes-A4"
         "Kubectl Kubernetes Free CheatSheet" "kubectl Kubernetes Free CheatSheet")

        ("4da43273857b83fc0fae55d434c46f65" "5258" "Kubernetes Yaml Templates" "kubernetes-yaml-templates"
         "" "yaml kubernetes Free CheatSheet")

        ("4452b028411f874953f1b1a7abcfeebf" "5256" "CheatSheet: Jenkins & Groovy" "cheatsheet-jenkins-groovy-A4"
         "Groovy Cheatsheet" "groovy jenkins Free CheatSheet")

        ("e6b0d4c7977bdad45b36ac4d13323126" "5252" "OpenShift Cheatsheet" "cheatsheet-openshift-A4"
         "" "Programming Free CheatSheet")

        ("ea9592c730504707e5aa17b425da0a7a" "5250" "Docker Free CheatSheet" "cheatsheet-docker-A4"
         "Docker Free CheatSheet" "docker Free CheatSheet")

        ("b834669eabfaf14f56abc0ca187025a7" "5153" "SSH Cheatsheet" "cheatsheet-ssh-A4"
         "" "ssh linux Free CheatSheet")

        ("11360129922e4254eca73c95b5eeb46d" "1158" "Cheatsheet: Failure Stories For IT Industry" "cheatsheet-failures-A4"
         "" "Failure Stories For IT Industry Free CheatSheet")

        ("735d719d9b0b7e35aaf570f85f6385f0" "4963" "Shell Free CheatSheet" "cheatsheet-shell-A4"
         "" "shell bash Free CheatSheet")

        ("86ccc17575e18a0a3997c628e625cf4b" "5246" "Git Free CheatSheet" "cheatsheet-git-A4"
         "Git Free CheatSheet" "git Free CheatSheet")

        ("6373af0f64a7735c1de6ec1bcc995782" "5254" "Cheatsheet: LeetCode Common Templates & Common Code Problems"
         "cheatsheet-leetcode-A4"
         "" "CheatSheet LeetCode")

        ("280454b8ce7ec3d5e1423e8a3ab55914" "5139" "Bosh Free CheatSheet" "cheatsheet-bosh-A4"
         "Bosh Free CheatSheet" "bosh Free CheatSheet")

        ("8ed7dcd85f963f6437952ecd59f68d93" "5238" "GCP Cheatsheet" "cheatsheet-gcp-A4"
         "" "gcp google cloud Free CheatSheet")

        ("eb73debb55e98027ae65522968fac9a5" "2434" "Rancher Cheatsheet" "cheatsheet-rancher-A4"
         "" "rancher kubernetes Free CheatSheet")

        ("56aab56a059e41dbbb60c7bb4576404e" "5236" "Minikube Cheatsheet" "cheatsheet-minikube-A4"
         "" "Programming Free CheatSheet")

        ("0abaa7a932152f51d8d5a8b0f45629d1" "5234" "CheatSheet: Professional Communication For IT Workers" "cheatsheet-communication-A4"
         "" "Communication Free CheatSheet")

        ("082198410a26b525a87bee33e574b05d" "2427" "CheatSheet: Kubernetes HealthCheck" "cheatsheet-k8s-healthcheck-A4"
         "" "Kubernetes Healthcheck Free CheatSheet")

        ("771e6da74a8f5e787073cd8d1187494c" "2439" "Cheatsheet: Web Browser" "cheatsheet-browser-A4"
         "" "Web Browser Chrome Firefox Free CheatSheet")

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ("104dc22eb6ea39874b2c592d3165e39b" "2438" "CheatSheet: VMware VSphere" "cheatsheet-vsphere-A4"
         "" "VMware VSphere Free CheatSheet")

        ("9d20312aa4a3e334783687d0f30c1434" "2435" "Cheatsheet: OpenSource Community" "cheatsheet-opensource-A4"
         "" "OpenSource CommunityFree CheatSheet")

        ("84cdc92f2b204db44af7e91c3e9e8af6" "63" "Cheatsheet: SSL" "cheatsheet-ssl-A4"
         "" "ssl Free CheatSheet")

        ("759f001699110c99c38de59f8517613b" "1371" "Cheatsheet: GKE - Google Kubernetes Engine" "cheatsheet-gke-A4"
         "" "GKE Google Kubernetes Engine Free CheatSheet")

        ("0d8c7b24ed7cbd6e8334517babbe2f1d" "1377" "Cheatsheet: Kubernetes Backup" "cheatsheet-k8s-backup-A4"
         "" "Kubernetes Backup Disaster Free CheatSheet")

        ("4d975f9f2ecc90ac7cc40d01ac80a308" "1374" "Cheatsheet: Iterm & Iterm2" "cheatsheet-iterm-A4"
         "" "iterm terminal Free CheatSheet")

        ("f8e9ce0ea3fa159b95fe94bba0712a8b" "1367" "Cheatsheet: Linux Capabilities" "cheatsheet-linux-capabilities-A4"
         "" "Linux Capabilities Free CheatSheet")

        ("864ee18ba9bd8dc08f26a4034e49013b" "67" "Iptables Cheatsheet" "cheatsheet-iptables-A4"
         "" "Programming Free CheatSheet")

        ("bf03e7ccb1e4caf46fe342ec7477157c" "1368" "Cheatsheet: Linux Security" "cheatsheet-linux-security-A4"
         "" "Security Linux Free CheatSheet")

        ("f4c4b5387e45eb5c4250da57f4c788fe" "42" "CheatSheet: VMware WCP" "cheatsheet-wcp-A4"
         "" "Free VMware WCP CheatSheet")

        ("142d68c6f889a0da934b3cd5aef89606" "56" "Cheatsheet: Kubernetes Harbor" "cheatsheet-harbor-A4"
         "" "Kubernetes Harbor Free CheatSheet")

        ("f69375450df6961484b99f1a1e8f5cab" "4949" "Cheatsheet: CRI-O" "cheatsheet-crio-A4"
         "" "CRI-O Docker Runtime Free CheatSheet")

        ("d8279a952652d55d02651295c8432573" "2428" "CheatSheet: IBM Products" "cheatsheet-ibm-A4"
         "" "IBM OpenShift Free CheatSheet")

        ("60e10bc36abd431ddaea631d8d5fe5d8" "1380" "Cheatsheet: rkt" "cheatsheet-rkt-A4"
         "" "rkt cri-o dockerd container runtime Free CheatSheet")

        ("5048cdd52310468ec302aa58a5e59aae" "2437" "Cheatsheet: containerd" "cheatsheet-containerd-A4"
         "" "containerd rkt cri-o dockerd container runtime Free CheatSheet")

        ("d3ee3598c62e9400eb342c5ced63cc4b" "2430" "Cheatsheet: Kubernetes Operator" "cheatsheet-operator-A4"
         "" "Kubernetes Operator Free CheatSheet")

        ("8a8449d6859841bd443a1f9e028e0546" "2436" "Cheatsheet: Kubernetes Istio" "cheatsheet-istio-A4"
         "" "Kubernetes Istio Free CheatSheet")

        ("92366de832db10d640e5b200b58b6fef" "2420" "Cheatsheet: Kubernetes Helm" "cheatsheet-helm-A4"
         "" "Chef Free CheatSheet")

        ("a162f6670f56c7660b9b4396bb2fd7e1" "1359" "CheatSheet: IT Career Path" "cheatsheet-it-career-A4"
         "" "IT Career Free CheatSheet")

        ("e7700b2043eaf3176965a05f3c6f0254" "1366" "Cheatsheet: Cloud Provision & Orchestration" "cheatsheet-cloud-provision-A4"
         "" "Programming Free CheatSheet")

        ("ca9e3c9d193ca0a88cd61c2a07e597b3" "59" "Cheatsheet: Kubernetes Cluster API" "cheatsheet-clusterapi-A4"
         "" "Kubernetes Clusterapi Free CheatSheet")

        ("225330510849f3479e0d3072ee5875d8" "4971" "Sed & Regexp Cheatsheet" "cheatsheet-sed-A4"
         "" "sed linux Free CheatSheet")

        ("c55a99d1d95e859ba16f568a8c78e365" "1378" "CheatSheet: SDN & VMware NSX-T" "cheatsheet-sdn-A4"
         "" "networking sdn NSX-T Free CheatSheet")

        ("36627aba788c667645d46114e6f3f584" "68" "PKS Free CheatSheet" "cheatsheet-pks-A4"
         "PKS Free CheatSheet" "PKS kubernetes Free CheatSheet")

        ("ed3a0db9bee84c18330d137e6550a36a" "1369" "Cloudfoundry Cheatsheet" "cheatsheet-cloudfoundry-A4"
         "" "Cloudfoundry Free CheatSheet")

        ("10ac3a850cc327dbd0323f64d0ce4ff0" "12" "ETCD Cheatsheet" "cheatsheet-etcd-A4"
         "" "etcd Free CheatSheet")

        ("8db0735bca8cda5f5cf90285cb4ba70d" "2432" "CheatSheet: Amazon AWS" "cheatsheet-aws-A4"
         "" "Amazon AWS Free CheatSheet")

        ("d7f2eca7c6ecadb94670d3cf84534d6a" "1373" "ElasticSearch Cheatsheet" "cheatsheet-elasticsearch-A4"
         "" "ElasticSearch Database Free CheatSheet")

        ("fabd8bae900b9050a1cbdc5195e0ed97" "4966" "Curl Cheatsheet" "cheatsheet-curl-A4"
         "" "curl rest Free CheatSheet")

        ("3cc47df2f50da01d5549efceea69b115" "62" "CheatSheet: Container Compliance" "cheatsheet-container-compliance-A4"
         "" "CheatSheet Compliance Docker Container")

        ("2800aa43c8566b16c8ccdeff31de8c34" "43" "Cheatsheet: Driver License Written Test" "cheatsheet-driver-license-A4"
         "" "Driver License Written Test Free CheatSheet")

        ("a70f03e2f5b9cbf892328e8780aed5d8" "4951" "Minishift Cheatsheet" "cheatsheet-minishift-A4"
         "" "openshift minishift kubernetes Free CheatSheet")

        ("ed2e96615ea7a48f26e99ab1d294b845" "2429" "Cheatsheet: Kubernetes Concepts & Glossary"
         "cheatsheet-kubernetes-glossary-A4"  "" "Programming Free CheatSheet")

        ("98a5ec104785887cac8918b6af7297fc" "1379" "CheatSheet: Virtualization & VMware VSphere" "cheatsheet-virtualization-A4"
         "" "virtualization computing Free CheatSheet")
        
        ("eef8aea7442e60f19d29c76e39db1a23" "1361" "Cheatsheet: Health For IT Workers" "cheatsheet-health-A4"
         "" "Programming Free CheatSheet")

        ("0283af0beaf912f395f295f031512c19" "9" "CheatSheet: Take Flights For Travel" "cheatsheet-travel"
         "" "travel flight life Free CheatSheet")

        ("db02128df371ee5876f2c2884a239005" "66" "Cheatsheet: Ubuntu Apt" "cheatsheet-apt-A4"
         "" "Programming Free CheatSheet")

        ("6db41a6d23c5cfa93475ecb971f84145" "1362" "Cheatsheet: Atlassian Confluence" "cheatsheet-confluence-A4"
         "" "confluence atlassian Free CheatSheet")

        ("17047177fd43d69a1e42ecf5df52a4e8" "4959" "CheatSheet: Linux Compress And Decompress" "cheatsheet-archive-A4"
         "" "zip unzip tar Free CheatSheet")

        ("1303cac7931673a47ae4d8b32564c8f4" "61" "Cheatsheet: Linux Crontab" "cheatsheet-cron-A4"
         "" "crontab cron Free CheatSheet")

        ("cb3e9a91918ac217510e2f523c2d7bcc" "114" "Cheatsheet: Rust Language" "cheatsheet-rust-A4"
         "" "Free Rust CheatSheet")

        ("ab59dafde505ad9beb79d42180b72a16" "5145" "Ruby Free CheatSheet" "cheatsheet-ruby-A4"
         "Ruby Cheatsheet" "ruby Free CheatSheet")

        ("0cebc5dbe665706729f2381563c71b07" "70" "Cheatsheet: Manage Images" "cheatsheet-image-A4"
         "" "Images Free CheatSheet")

        ("c19317ea636aeb65157c95616385f83d" "4961" "Vim Free CheatSheet" "cheatsheet-vim-A4"
         "Vim Cheatsheet" "vim linx Free CheatSheet")

        ("1ab47999ab7af37f8221c20fc1a95ed9" "5142" "Tmux/Tmate Free CheatSheet" "cheatsheet-tmux-A4"
         "Tmux/Tmate Free CheatSheet" "tmux tmate Free CheatSheet")

        ("583b4f689fe27915ec3cc0d5f541a71a" "53" "JQ Free CheatSheet" "cheatsheet-jq-A4"
         "JQ Cheatsheet" "jq Free CheatSheet")

        ("068e94e6da0efdbfc4ef72881db67062" "48" "Cheatsheet: Cloudfoundry UAA" "cheatsheet-uaa-A4"
         "Cheatsheet: Cloudfoundry UAAC" "uaac security Free CheatSheet")

        ("237510308a4ea36f2c1ff280c1e03182" "55" "Knative Free CheatSheet" "cheatsheet-knative-A4"
         "Knative Cheatsheet" "knative serverless Free CheatSheet")

        ("37fe5b586265104b4646adb927817e68" "58" "Slack Cheatsheet" "cheatsheet-slack-A4"
         "" "slack Free CheatSheet")

        ("b33c1fe6f1ce4c2f14f90c05d5c9eeea" "65" "Programming Language Implemenetations" "cheatsheet-language-A4"
         "Programming Language Implemenetations Cheatsheet" "nano linx Free CheatSheet")

        ("083a43c00561d322bc8df3d1958835ef" "5174" "CheatSheet: System Design For Job Interview" "cheatsheet-systemdesign-A4"
         "" "Free System Design CheatSheet")

        ("ac31b28708b3b7a0c4be9a39ebcbd21d" "60" "Tcpdump Cheatsheet" "cheatsheet-tcpdump-A4"
         "" "tcpdump network Free CheatSheet")

        ("06735a62ff6445b07c2bb0b7d6984c4e" "47" "Cheatsheet: VMware Govmomi" "cheatsheet-govmomi-A4"
         "" "VMware Govmomi Free CheatSheet")

        ("a1e8adcc78592847cdf2848cc778aaf8" "5164" "Emacs Free CheatSheet" "cheatsheet-emacs-A4"
         "Emacs Free CheatSheet" "emacs Free CheatSheet")

        ("619b71cd3c59044563c51a7ec9dd9f02" "4983" "Cheatsheet Prometheus" "cheatsheet-prometheus-A4"
         "" "Prometheus Free CheatSheet")

        ("0de10143b9b93a564ef43eeb65523610" "45" "CheatSheet: Living In Canifornia" "cheatsheet-living-in-ca"
         "CheatSheet: Living In Canifornia" "Canifornia Free CheatSheet")

        ("79be96c4c228c630a90a852d7d426bba" "59" "Cheatsheet: cp & rsync" "cheatsheet-cp-A4"
         "" "cp rsync copy Free CheatSheet")

        ("1867302ad273d8fde59fa26727abe953" "4" "Contact" "contact"
         "Contact cheatsheet.dennyzhang.com" "Programming Free CheatSheet")

        ("b18bb17cd2f1aec54d38eb49c6ad4b57" "50" "Visa Cheatsheet" "cheatsheet-visa-A4"
         "" "visa US H1B H4 PERM GreenCard Free CheatSheet")

        ("d8e6e9332e4b654c2fb17075f0f2b1a5" "1365" "Couchbase Cheatsheet" "cheatsheet-couchbase-A4"
         "" "Couchbase Database Free CheatSheet")

        ("ee565fe71594462316f7929e15c3fe6d" "4975" "CheatSheet: Well-Known Papers For IT Industry" "cheatsheet-paper-A4"
         "" "Free CheatSheet")

        ("58e60c9f8addbf01c47c424dfa06e54e" "5168" "CheatSheet: Behavior Questions For Coder Interview"
         "cheatsheet-behavior-A4" "" "Free CheatSheet")

        ("6707ae4bbb73dfb6b4e51f92957aacf1" "2421" "Cheatsheet: V language" "cheatsheet-v-A4"
         "" "V language Free CheatSheet")

        ("843a42f5def48c423934b369e9ff850f" "4987" "CheatSheet: Linux Process" "cheatsheet-process-A4"
         "" "Programming Free CheatSheet")

        ("df84fe179e4f170fe52822fd8e11f6e0" "1375" "Cheatsheet: VMware Wavefront" "cheatsheet-wavefront-A4"
         "" "VMware Wavefront monitoring Free CheatSheet")

        ("884e5a593444d5f4f2ba0d82089a0dad" "1360" "CheatSheet: Cloudfoundry Tile & OpsManager" "cheatsheet-tile-A4"
         "" "Cloudfoundry Tile Opsmanager Free CheatSheet")

        ("3103652d8778658ef9c8cc4de3c671a9" "2426" "Cheatsheet: Data Store In Public Cloud" "cheatsheet-public-db-A4"
         "" "Database Free CheatSheet")

        ("d133b888cc466362fecfc981fb4230d5" "2422" "Cheatsheet: Kubernetes Security" "cheatsheet-k8s-security-A4"
         "" "Programming Free CheatSheet")

        ("018de717addf55e719d9e44ab73f0eec" "2423" "Cheatsheet: VMware VROPS" "cheatsheet-vrops-A4"
         "" "VMware vrops Free CheatSheet")

        ("04da5d69e5be70a446a910d747855710" "2424" "Wordpress Cheatsheet" "cheatsheet-wordpress-A4"
         "" "Wordpress Free CheatSheet")

        ("4c3ff6997f0df112bda3099bc2de9f74" "2425" "Mongodb Cheatsheet" "cheatsheet-mongodb-A4"
         "" "Mongodb Free CheatSheet")
        ))

(setq xml-rpc-allow-unicode-string nil)

(setq mywordpress-server-url "https://cheatsheet.dennyzhang.com"
      mywordpress-updatemeta-url ""
      mywordpress-username "cheatsheetdenny"
      BlOG-TAG "BLOG"
      POST-TAIL (concat "Connect with Denny In <a href='https://linkedin.com/in/dennyzhang001'>LinkedIn</a> Or <a href='mailto: contact@dennyzhang.com'>Mail</a>" google-adsense)
      ORG-CSS-FILE "https://cdn.dennyzhang.com/css/org-cheatsheet.css"
      mywordpress-pwd "dennypassword123")

(defun my-org-latex-export-to-pdf (&optional async subtreep visible-only body-only ext-plist)
  (interactive)
  (let ((outfile (org-export-output-file-name ".tex" 't)))
    (progn
      ;; remove html code block
      (goto-char (point-min))
      (while (search-forward-regexp "#\\+BEGIN_HTML" nil t)
        (setq start-pos (- (point) (length "#\\+BEGIN_HTML")))
        (when (search-forward-regexp "#\\+END_HTML" nil t)
          (setq end-pos (point))
          (delete-region start-pos end-pos)
          )
      )

      (org-export-to-file 'latex outfile
        async subtreep visible-only body-only ext-plist
        (lambda (file) (org-latex-compile file))))
    )
  )
