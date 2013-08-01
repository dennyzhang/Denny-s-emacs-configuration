;; -*- coding: utf-8 -*-
;; File: wordpress-post.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2013-08-01 10:57:08>
;; --8<-------------------------- separator ------------------------>8--
(setq list-md5-id-title
      '(
        ;;("012fcbe8b922b317852870d3857b801a" 554 "[Denny] 分布式数据库 -- Distributed Database")
        ;;("dd7972a1cd67fb2e655a2ec64feeac33" 248 "[Denny] 云平台")
        ;;("0bca1df4f8dca2cc54864da619309ee5" 249 "[Denny] 分布式系统中, 强一致性")

        ("e91bf9ed018289501e716203ff2237a8" 4645 "[Denny] 云计算常识")
        ("d190350c888b9c7adaa1b4c0c025e9db" 4867 "[Denny] IO profiling")
        ("cf6d4c57c905e01e016e9c148a4bfc75" 549 "[Denny] [Programming life] Empower mobile phones for local knowledge-base")
        ("2ce2567cb72d0dc24faec01008bb205d" 243 "[Denny] Daily life -- 日常家务")
        ("f20035de6081f6511cd34ba6f3a047fd" 252 "[Denny] 推荐书目 — 欢迎追加")
        ("1af0a8d51e754804dc8a29d06b62bd5d" 2275 "[Denny] PaaS系统开发的经验总结")
        ("fa9a03df21156b03f294bec81443030a" 3229 "[Denny] How to design test case for PaaS system")

        ("a77816667dba21e27b7e2ccc162d2448" 5349 "[Denny] 商派码农再议12306")
        ("9ceb4d12c84c207045992ce4427a2b4f" 8410 "[Denny] How To Test Paas Platform (副标题: 商派电子商务云平台的回顾和反思)")

        ("59b8aa4d8def0bb7ae8f709c4cf1a135" 234 "[Denny] Erlang")
        ("ff9b52fda7dca76f367ab565cd70104c" 236 "[Denny] Elisp")
        ("e5792fe338cc1e325a03b4ff64767c86" 1518 "[Denny] Algorithm Question -- 每日一算法")
        ("9a4533361bc29153e047ea05c20cf365" 216 "[Denny] Mnesia — Erlang的DMBS")
        ("52bf2b526f7c54a89902eadd12b703dc" 233 "[Denny] Emacs misc features")
        ("2ee5b436678bdfae73904e541a7ecd2e" 557 "[Denny] 公众演讲: How to deliver a public speech")
        ("8c825c42309004ae5e912a382c8a5ebb" 559 "[Denny] tsung: an open-source multi-protocol distributed load testing tool")
        ("49e9dee849af541bf4e4197e7ae0e95c" 934 "[Denny] Fun -- 电影 & 音乐")
        ("8d2382a454827ff0acb3ddb071f8c8b6" 1017 "[Denny] Child education -- 孩子教育")
        ("29fdcd436940e3f07842fa4ac42258a3" 1019 "[Denny] Work Skill + Software -- 实用软件")
        ("7d2e1f114303ea02918d2d8534b329a0" 1305 "[Denny] Health — 健康")
        ("5e92572a5a50968ca00e23ff3ff8be0d" 1697 "[Denny] 电商的数据分析和处理")
        ("d9d82b8a27d392317be812c7174c44d9" 2539 "[Denny] Linux http")
        ("4c68b5cb04d9c784396e9f6aa02516b2" 2824 "[Denny] puppet: 强大的中心化配置管理系统 -- SA的利器")

        ("90ac35ae8c4c332a57203920b275dc51" 3698 "[Denny] Difficulties in Python")
        ("f477b91154bb421fe12da0231a1c68df" 3893 "[Denny] music in daily life")
        ("731139af6de20d46044827f8aad384ce" 4202 "[Denny] Difficulties in emacs")
        ("9c5d4af2573027b0b61b920501ad1616" 4213 "[Denny] Difficulties in zabbix")
        ("c3afca1e7d69c936d4a9627520ff4401" 4364 "[Denny] Empower your knowledge -- 知识库管理")
        ("2658854e1ba51d656deb4bf7301acf55" 4367 "[Denny] Be happy with your family and friends -- 社交管理")
        ("90dd4a40592c7008a3242a484c7fe5f4" 4369 "[Denny] Be friends with your soul -- 自我管理")


        ("ab572f73132656fe14ef067ab1ec2c86" 4763 "[Denny] linux /proc filesystem")
        ("6564602080ea28f277f2ab395095160c" 4799 "[Denny] Difficulties in puppet")
        ("79a25c6d37d3d7aa37d49be5b766f419" 4803 "[Denny] Useful shell code snippet")
        ("6cab7dfbfb3c122332ccf0e5593bb20a" 4936 "[Denny] Difficulties in erlang")
        ("4b0a9739f68136ba2d2a5a7d5bb38c05" 4960 "[Denny] tcpdump")
        ("f0bafc66077f5cbf5c656aa2e27faeae" 5032 "[Denny] Linux network troubleshooting")
        ("63004207f7b75f96ac3cf5f783cb5a76" 5034 "[Denny] Difficulties in Hudson/Jenkins")
        ("66bbbf0e832187dc12b79b25c5623539" 5057 "[Denny] Difficulties in shell/bash")
        ("a5c196d7978add02e258af2a31a5b761" 5059 "[Denny] Form good habits -- 养成良好的习惯")
        ("2be42aee5276b8f016dee4f553eb8aaf" 5454 "[Denny] Linux internal: 研究linux源码，它山之石可以攻玉")
        ("9a15e9d2f7f48b0d71f3fe970fbba15c" 5476 "[Denny] [置顶] Motto -- 人生格言")
        ("8cb2825a5242eec670f5ffa4aab3b288" 5485 "[Denny] linux调试工具集")
        ("f8c59fe0cfe47bc4db33864df60354da" 5693 "[Denny] Linux network -- tcp/ip")
        ("aa442dced0dd3629eca39f14fd8c24c1" 5767 "[Denny] Technical problems in my daily work -- 工作中遇到的疑难杂症")
        ("60287684a49aa965dd603353cdeda751" 5698 "[Denny] [Programming life] Leverage Ramfs to fasten your intense disk access")
        ("344d1931f2c4ce692b4cd617625a8283" 5695 "[Denny] Erlang Implementations Details")
        ("791fd82867b54c7353c9393045897010" 5273 "[Denny] Emacs — fundanmental features")
        ("93cf6cd6e42d178c740407e64cde23ad" 8161 "[Denny] linux performance analysis")
        ("8192cd8e64030f55379112af2ede5c72" 6309 "[Denny] Daily Journal logging for I am doing everyday -- 工作日志")
        ("cfca3c3a4d874d4f9d47990967a4ebf7" 7867 "[Denny] Google Go")
        ("8a81647c0b408e66aad14415480befa8" 7882 "[Denny] Fighting with mac")
        ("399fe99a23432b476f8b803cc7cbf5ce" 6268 "[Denny] git")

        ("49482b38b0e52cea09356e3ba1effd64" 6033 "[Denny] 数据分析 -- Data analysis & Big Data")
        ("3b186162b50b07a58597ac989a1cea30" 6523 "[Denny] 数据分析基本知识 -- 统计学及线性代数")
        ("70d9f395b067a308617a1e9a9b281846" 6264 "[Denny] Selenium -- GUI automation")
        ("aa0f5ca16ea0703d4a371ca1608d72a5" 8133 "[Denny] Difficulties in mongodb")
        ("429c92099c27f80a689fd3b07ffa95b9" 8182 "[Denny] Mail in emacs -- gnus")

        ("2673753f5e99ed3823e2d428123126bd" 8326 "[Denny] linux systemtap")
        ("a5084c5b36f309e58b2629bed5212e6a" 8445 "[Denny] Objective-C")
        ("64ae47502012e5348bd8af5bb01e8506" 8418 "[Denny] R: The R Project for Statistical Computing")
        ("5ebc33327869e48d20bb9a66de18bc11" 8433 "[Denny] erlang debug skills")
       ))
;; Temporarily export specific web pages
;; (setq list-md5-id-title
;; '(
;; ("39c2dd4f4f788c4560b9f19d75b066c2" 3792 "[Denny] Locking in programming")
;; ))

(setq mywordpress-server-url "http://blog.ec-ae.com/xmlrpc.php"
      mywordpress-username "zhangwei"
      mywordpress-pwd "filebat")
;; --8<-------------------------- separator ------------------------>8--
;; (setq list-md5-id-title
;; '(
;; ("012fcbe8b922b317852870d3857b801a" 7 "[Denny] 分布式数据库 -- Distributed Database")
;; ("59b8aa4d8def0bb7ae8f709c4cf1a135" 8 "[Denny] Erlang")
;; ("038aa9a1ba8f92556f439d38229b76de" 9 "[Denny] Python")
;; ("e91bf9ed018289501e716203ff2237a8" 10 "[Denny] 云计算常识")
;; ("9a4533361bc29153e047ea05c20cf365" 11 "[Denny] Mnesia — Erlang的DMBS")
;; ("6cbca02aa2c90e0e8e34e78eacd9f7d6" 12 "[Denny] 分布式消息队列 — Advanced Message Queuing Protocol")
;; ("23273917e4844f15f3d83ef5a3839f61" 13 "[Denny] Cloud continous test")
;; ("4e5444ffb76773560df4716b07d78ec9" 14 "[Denny] 分布式服务管理框架 -- Configuration management")
;; ("54e413d5e81f0e2d31163f131b563e45" 15 "[Denny] zookeeper: Yahoo在Apache上推出了Google Chubby一个开源的实现")
;; ("8c825c42309004ae5e912a382c8a5ebb" 16 "[Denny] tsung: an open-source multi-protocol distributed load testing tool")
;; ("dd7972a1cd67fb2e655a2ec64feeac33" 17 "[Denny] 云平台")
;; ("d190350c888b9c7adaa1b4c0c025e9db" 18 "[Denny] IO profiling")
;; ("0bca1df4f8dca2cc54864da619309ee5" 19 "[Denny] 分布式系统中, 强一致性")
;; ("887b6096ff54c33c376eb66f3a86cca6" 20 "[Denny] Consistency一致性")
;; ("cf731efe6bef7d73d67f0004c9740683" 21 "[Denny] 分布式文件系统 -- Amazon S3")
;; ("aec6c0f34096e46e4a84c6f93e65bc76" 22 "[Denny] QA & 运维")
;; ("cb2ecbebc8321ad3716b692ff9ba019b" 23 "[Denny] Facebook thrift — 是一个跨语言的服务部署框架" )
;; ("05fd3d60e6b3a22a0586d8e2382fa0e6" 24 "[Denny] 云计算中的资源隔离 -- Resource segregation")
;; ("52bf2b526f7c54a89902eadd12b703dc" 25 "[Denny] Emacs misc features")
;; ("d42899da7e76727fa9c3d429a8ecef9b" 26 "[Denny] Emacs — fundanmental features")
;; ("ff9b52fda7dca76f367ab565cd70104c" 27 "[Denny] Elisp")
;; ("ea89b68c34ce4a63c0f77e17413c6e30" 28 "[Denny] Shell")
;; ("2ce2567cb72d0dc24faec01008bb205d" 29 "[Denny] Daily life -- 日常家务")
;; ("7d2e1f114303ea02918d2d8534b329a0" 30 "[Denny] Health — 健康")
;; ("619df36bf676fb7fc4b98c391bc1e913" 31 "[Denny] 推荐书目 — 欢迎追加")
;; ("c0838b3c9e848c8134de8acc6a331ef5" 33 "[Denny] 推荐电影 -- 欢迎追加")
;; ("8d2382a454827ff0acb3ddb071f8c8b6" 34 "[Denny] Child education -- 孩子教育")
;; ("c6edf38b312bb72f7b662028b6c6c796" 35 "[Denny] 自我管理 -- GTD & PKM")
;; ("9a15e9d2f7f48b0d71f3fe970fbba15c" 36 "[Denny] [置顶] Motto -- 人生格言")
;; ("5ebc33327869e48d20bb9a66de18bc11" 37 "[Denny] erlang debug skills")
;; ("4bec3100a0cd3a6aaa076e7d44558c9f" 38 "[Denny] erlang code analysis")
;; ("79a25c6d37d3d7aa37d49be5b766f419" 39 "[Denny] Useful shell code snippet")
;; ("b87750233d64347d6ebcfab95419c19e" 40 "[Denny] linux")
;; ("eb5b08e6c1308ab9339e2965808cb2e5" 110 "[Denny] linux常用工具语言")
;; ("5f10e6118c7487a577f9869315c4622a" 112 "[Denny] Music -- 音乐")
;; ("9973e899eb8912d2ebd846fa777d5efe" 114 "[Denny] Openstack")
;; ))
;; (setq mywordpress-server-url "http://184.72.209.168/wordpress/xmlrpc.php"
;; mywordpress-username "admin"
;; mywordpress-pwd "sophia")
;; (setq not-tracked-org-post '())
;; --8<-------------------------- separator ------------------------>8--
;; File: wordpress-post.el ends here
