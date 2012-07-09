;; -*- coding: utf-8 -*-
;; File: wordpress-post.el
;;
;; Author: Denny Zhang(markfilebat@126.com)
;; Created: 2008-10-01
;; Updated: Time-stamp: <2012-07-09 00:11:59>
;;
;; --8<-------------------------- separator ------------------------>8--
(setq list-md5-id-title
      '(
        ("012fcbe8b922b317852870d3857b801a" 554 "[Denny] 分布式数据库 -- Distributed Database")
        ("52bf2b526f7c54a89902eadd12b703dc" 233 "[Denny] Emacs misc features")
        ("59b8aa4d8def0bb7ae8f709c4cf1a135" 234 "[Denny] Erlang")
        ("038aa9a1ba8f92556f439d38229b76de" 434 "[Denny] Python")
        ("ff9b52fda7dca76f367ab565cd70104c" 236 "[Denny] Elisp")
        ("e91bf9ed018289501e716203ff2237a8" 240 "[Denny] 云计算常识")
        ("9a4533361bc29153e047ea05c20cf365" 216 "[Denny] Mnesia — Erlang的DMBS")
        ("6cbca02aa2c90e0e8e34e78eacd9f7d6" 238 "[Denny] 分布式消息队列 — Advanced Message Queuing Protocol")
        ("ea89b68c34ce4a63c0f77e17413c6e30" 239 "[Denny] Shell")
        ("23273917e4844f15f3d83ef5a3839f61" 549 "[Denny] Cloud continous test")
        ("4e5444ffb76773560df4716b07d78ec9" 561 "[Denny] 分布式服务管理框架 -- Configuration management")
        ("54e413d5e81f0e2d31163f131b563e45" 557 "[Denny] zookeeper: Yahoo在Apache上推出了Google Chubby一个开源的实现")
        ("8c825c42309004ae5e912a382c8a5ebb" 559 "[Denny] tsung: an open-source multi-protocol distributed load testing tool")
        ("7d2e1f114303ea02918d2d8534b329a0" 1305 "[Denny] Health — 健康")
        ("dd7972a1cd67fb2e655a2ec64feeac33" 248 "[Denny] 云平台")
        ("d190350c888b9c7adaa1b4c0c025e9db" 245 "[Denny] IO profiling")
        ("0bca1df4f8dca2cc54864da619309ee5" 249 "[Denny] 分布式系统中, 强一致性")
        ("887b6096ff54c33c376eb66f3a86cca6" 251 "[Denny] Consistency一致性")
        ("f20035de6081f6511cd34ba6f3a047fd" 252 "[Denny] 推荐书目 — 欢迎追加")
        ("cf731efe6bef7d73d67f0004c9740683" 341 "[Denny] 分布式文件系统 -- Amazon S3")
        ("aec6c0f34096e46e4a84c6f93e65bc76" 552 "[Denny] QA & 运维")
        ("cb2ecbebc8321ad3716b692ff9ba019b" 881 "[Denny] Facebook thrift — 是一个跨语言的服务部署框架" )
        ("0fe628af0698f632bbb40a130869399e" 934 "[Denny] 推荐电影 -- 欢迎追加")
        ("8d2382a454827ff0acb3ddb071f8c8b6" 1017 "[Denny] Child education -- 孩子教育")
        ("2ce2567cb72d0dc24faec01008bb205d" 243 "[Denny] Daily life -- 日常家务")
        ("05fd3d60e6b3a22a0586d8e2382fa0e6" 1518 "[Denny] 云计算中的资源隔离 -- Resource segregation")
        ("0a70ef1ac75aad6ffcf1d51e6d3915cd" 1659 "[Denny] erlang code tool")
        ("bed301b5e8a7aa3269c4715b4994d409" 1693 "[Denny] linux常用工具语言")
        ("5f10e6118c7487a577f9869315c4622a" 338 "[Denny] Music -- 音乐")
        ("9973e899eb8912d2ebd846fa777d5efe" 1697 "[Denny] Openstack")
        ("29fdcd436940e3f07842fa4ac42258a3" 1019 "[Denny] Work Skill + Software -- 实用软件")
        ("f97d5c9d0ef27ab408d4eb2cb37363ad" 1307 "[Denny] linux security")
        ("2673753f5e99ed3823e2d428123126bd" 2158 "[Denny] linux systemtap")
        ("fcb8feffc8536a4113836c26626dadff" 4202 "[Denny] linux signal -- 信号")
        ;; important posts
        ("b3027400ad46f11128d4c1b842e06594" 2824 "[Denny] 技术网页分享")
        ("9a15e9d2f7f48b0d71f3fe970fbba15c" 3698 "[Denny] [置顶] Motto -- 人生格言")
        ("791fd82867b54c7353c9393045897010" 2542 "[Denny] Emacs — fundanmental features")
        ("8cb2825a5242eec670f5ffa4aab3b288" 2539 "[Denny] linux调试工具集")
        ("c6edf38b312bb72f7b662028b6c6c796" 2751 "[Denny] 自我管理 -- GTD & PKM")
        ("1af0a8d51e754804dc8a29d06b62bd5d" 2275 "[Denny] PaaS系统开发的经验总结")
        ("eae6968ec9638dc01fe235bc7dddcbb9" 3760 "[Denny] Help me by discussing my questions/puzzles -- 赏金问题")
        ("5ebc33327869e48d20bb9a66de18bc11" 3052 "[Denny] erlang debug skills")
        ("79a25c6d37d3d7aa37d49be5b766f419" 3792 "[Denny] Useful shell code snippet")
        ("fa9a03df21156b03f294bec81443030a" 3229 "[Denny] How to design test case for PaaS system")
        ("f579023d3b8347172362e5025d438b3d" 2346 "[Denny] Functional Programming 函数式编程")
        ("39c2dd4f4f788c4560b9f19d75b066c2" 3129 "[Denny] Locking in programming")
        ("abd54648a1ca060cc85d686cc85768f9" 3893 "[Denny] Programming life -- 程序人生")
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
