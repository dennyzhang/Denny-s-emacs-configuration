;; -*- coding: utf-8 -*-
;; File: wordpress-architect-post.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-02-03 15:37:45>
;; --8<-------------------------- separator ------------------------>8--
(setq list-post-meta
      ;; title-md5, post-id, post-title, blog-uri, meta-description, keywords
      '(
        ("a78c815c1aa98a103849084c5acf2b19" "196" "How You Speed Up Twitter Feed Loading" "speedup-feed-loading"
         "How You Speed Up Twitter Feed Loading" "System Design")

        ("ba6b56de31240344d29bc21e20ffece1" "195" "YouTube For System Design" "design-youtube-links"
         "YouTube For System Design" "System Design")

        ("00ec28bbaf41f566507b9489a009f6bd" "194" "Books For System Design" "design-books"
         "Books For System Design" "System Design")

        ("67cb73bde1ff312dbecc9666731044dd" "193" "GitHub For System Design" "design-resource-github"
         "GitHub For System Design" "System Design")

        ("8b1ad19f21e3ff8bf59850611ce3f93a" "192" "Papers For System Design" "design-papers"
         "Papers For System Design" "System Design")

        ("36890d28080b4618897653eace2b6706" "191" "Blogs For System Design" "design-blog-links"
         "Blogs For System Design" "System Design")

        ("1e55257ac1849b7d136051e188c50463" "189" "Design Exercise: Marketplace System" "design-marketplace"
         "Design Exercise: Marketplace System" "System Design")

        ("e1e057cb2099ff5c2c8def41592f62bc" "190" "Design Exercise: Budget Advising" "design-budget"
         "Design Exercise: Budget Advising" "System Design")

        ("XXX" "188" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "187" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "213" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "211" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "210" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "209" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "208" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "207" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "206" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "205" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "204" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "203" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "201" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "200" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "199" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "198" "TestSubject" "test"
         "TestSubject" "System Design")

        ("7cef531131a60f71a6c0e60186995b61" "6" "Contact" "contact"
         "Contact" "System Design")

        ("a1f2ea3747796fadd201f99685f72690" "119" "Deep Dive Into Couchbase System Design" "couchbase-design"
         "Deep Dive Into Couchbase System Design" "System Design")

        ("3c0fd2ff1f674695511343357fba94ff" "121" "Deep Dive Into Elasticsearch System Design" "elasticsearch-architect"
         "Deep Dive Into Elasticsearch System Design" "System Design")

        ("562ffa8ed4e30a4ae4f38ffc59fd554a" "30" "Design: A Photo Reference Counting System At Scale" 
         "design-photo-counting"
         "Design: A Photo Reference Counting System At Scale" "System Design")

        ("ee0a14c76606d9713b23e9edb22702c0" "84" "Design: Uber Backend" "design-uber"
         "Design uber backend" "System Design")

        ("410217e3ff4db2a533d0364e4f525fbe" "32" "Design: A Parking Lot Service" "design-parkinglot"
         "Design: A Parking Lot Service" "System Design")

        ("849f42562b223348f561a37449f4c352" "31" "Design: A Key-Value Data Store" "design-kv-store"
         "Design: A Key-Value Data Store" "System Design")

        ("3f94f74fb4075aabb7146c49d27e4543" "141" "Design: An Elevator Service" "design-elevator"
         "Design: An Elevator Service" "System Design")

        ("0e6b3e4adc6ebf581a9a72938be70f52" "39" "Design: Explain Google FileSystem Service" "design-gfs"
         "Design: Explain Google FileSystem Service" "System Design")

        ("24bc789f2930f983b1d5d683ac2fabdf" "85" "Typical Question: What If Your System Grow 10M Users?"
         "system-grow-big"
         "Typical Question: What If Your System Grow 10M Users?" "System Design")

        ("c00df5a259dd9cf7a29a11a0a2311a89" "87" "Typical Question: How You Make Your Design Production Ready?"
         "production-ready"
         "Typical Question: How You Make Your Design Production Ready?" "System Design")

        ("caa7494a5de9326d032cbffd6192517e" "107" "Explain: How Redis HA Model Works?" "redis-ha"
         "Explain: How Redis HA Model Works?" "System Design")

        ("0634f998f7e1fabe6d2a5aa5bee1afc1" "108" "Design An API Rate Limiter" "design-api-limiter"
         "Design an API Rate Limiter" "System Design")

        ("831e506da0832425446f8622ee4e1940" "109" "Design: How To Partition Data At Scale" "design-partition-data"
         "Design: How To Partition Data At Scale" "System Design")

        ("7f1703aff4ac2cbce888d70eafca32b1" "110" "Design: How To Migrate Cluster Across Regions" "design-migrate-cluster"
         "How to migrate cluster across regions with minimum impact?" "System Design")

        ("c4dd3dcfe27524840b163a3f0b42e462" "111" "Design Replication Process For Huge File Changes" "design-replication-process"
         "How To Sync Huge File Changes To Other Nodes?" "System Design")

        ("f4037e347d7ae67c334688aec32e6b86" "112" 
         "Explain: What Problems Of MySQL Master HA Are?" "mysql-master-ha"
         "Explain: What Problems Of MySQL Master HA Are" "System Design")

        ("417b9d3442d9456087713422e41c8513" "113" "Design: Google Suggestion Service" "design-google-suggestion"
         "Design: Google Suggestion Service" "System Design")

        ("5b05bdf3aab88ec0908f7291bbde3d8a" "114" "Design: A URL Redirecting Feature"
         "design-url-redirect"
         "Design: A URL Redirecting Feature" "System Design")

        ("79a07129934dba1caeb2d94ff8a1220c" "115" "In Deployment Pipeline, How To Support Customizing DB Password?"
         "review-deployment-credential"
         "Design: In Deployment Pipeline, How To Support Customizing DB Password?" "System Design")

        ("1335159e7bff8ad61a645af23790d300" "116" "Typical Question: How You Will Test Your Code?" 
         "how-test-code"
         "Typical Question: How You Will Test Your Code?" "System Design")

        ("56239ca5eb76993bab5bb990892fc6a7" "117" "Design: Speed Up DB Rebalancing For A Big NoSQL DB Cluster" 
         "design-speedup-rebalance"
         "Design: Speed Up DB Rebalancing For A Big NoSQL DB Cluster" "System Design")

        ("d26d46bff4ab2a9b85cd8c24ce4d4a93" "118" "Design: TinyURL - A URL Shorterner Service" "design-tiny-url"
         "Design: A URL Shorterner Service" "System Design")

        ("c4167e05160b7d437d78ee244be1783e" "39" "Design: Explain Google Big Table Service" "design-bigtable"
         "Design: Explain Google Big Table Service" "System Design")

        ("1df0dc01aa508c3f5cd7fe9330788814" "67" "Explain CAP Theorem" "design-cap"
         "Explain CAP Theorem" "System Design")

        ("df2d7d7dc36f6a3335885c2c59e6d9d0" "69" "Explain: Pessimistic And Optimistic Locking" "design-locks"
         "Explain: Pessimistic And Optimistic Locking" "System Design")

        ("d0e5d278a2aed31b5dbfa6841490ae93" "70" "Explain Paxos Algorithm" "design-explain-paxos"
         "Explain Paxos Algorithm" "System Design")

        ("62e0773325e4f29f190a25cd012dc09c" "71" "Design: A Distributed Lock" "distributed-lock"
         "Design: A Distributed Lock" "System Design")

        ("5801211685ecd966d67b65133d3b93be" "72" "Typical Question: How Does Consistent Hashing Work?" "design-consistent-hash"
         "Typical Question: How Does Consistent Hashing Work?" "System Design")

        ("21e31f9d98c3c38cb5d4ff0c7f88b0de" "73" "Design: DB Replication" "design-db-replication"
         "Scale a single-node DB into a cluster with HA" "System Design")

        ("ae177120a2a1328db062f0fbbf6a7874" "74" "Design: How Does DNS Work?" "design-dns"
         "Design: How Does DNS Work?" "System Design")

        ("0875b068ce6bd299d8aa01ba473f8f4a" "75" "Design: How Does LoadBalancer Work?" "design-explain-lb"
         "Design: How Does LoadBalancer Work?" "System Design")

        ("bd4d84024b595e1c602d8f9ab675e403" "76" "Design: Poll vs Push" "design-poll-push"
         "Design: Poll vs Push" "System Design")

        ("f3a66756062a108d5ec49a06b63f1622" "77" "Design: How Does Caching Work" "design-cache"
         "Design: How Does Caching Work" "System Design")

        ("e7d401c60a40e768014c231d5c794075" "78" "Explain: Vector Clocks/Version Vectors" "vector-clocks"
         "Explain: Vector Clocks/Version Vectors" "System Design")

        ("33e5f78cffd7bee08b4df026424154b1" "79" "Design: A Distributed Counter" "design-distributed-counter"
         "Design: A Distributed Counter" "System Design")

        ("e3224d757d49b72d0dd6ff55a0c092e7" "80" "Design: What Are Your Experience With Session Design?"
         "design-session"
         "What Are Your Experience With Session Design?" "System Design")

        ("b3e58f918c22e05be8f79b0dd5f96bc2" "81" "Design: What You Will Do, If Your DB Runs Into Split Brain?"
         "design-split-brain"
         "Design: What You Will Do, If Your DB Runs Into Split Brain?" "System Design")

        ("663cd3c720ee6ea8c8ac1a039e0e4765" "82" "How To Save Users' Login Credentials In Your DB?"
         "design-store-credential"
         "How To Save Users' Login Credentials In Your DB?" "System Design")
        
        ("dab6dc3d2bbb94cacbf45a539ad81872" "83" "Concurrency & Communication"
         "design-coordination"
         "Coordination: With Accuracy Improve Performance" "System Design")

        ("ce520ec7d4330a6faa017b133830b180" "138" "Explain: Gossip Protocol" "design-explain-gossip"
         "How Gossip protocol works?" "System Design")

        ("90989b7e8542145d388875d018371ad3" "24" "Deep Dive Into System Design" "system-design-interview"
         "Deep Dive Into System Design" "System Design")

        ("d15e4bfe2cda47b6dca87b8a46723d66" "26" "Concepts For System Design" "design-concept"
         "Concepts For System Design" "System Design")

        ("e8125c807f8dd46bff4f02f304a55fb6" "27" "Typical Trade-Off In System Design" "design-tradeoff"
         "Typical Trade-Off In System Design" "System Design")

        ("d88956ffb4fb4090cf58c6665727b240" "28" "Resource: Fundamental Questions In System Design" "design-fundamental"
         "Resource: Fundamental Questions In System Design" "System Design")

        ("4acb3a0c643da22a6e7d12a398d69d10" "137" "Resource: Patterns Of Container Architecture Design" "design-container"
         "Resource: Patterns Of Container Architecture Design" "System Design")

        ("bf00e33fd9cfbf4677e816ed860cd3fa" "140" "Resource: General Principles In Cloud Computing" "design-principles"
         "Resource: General Principles In Cloud Computing" "System Design")

        ("04f608a4ade024e31a2a22e58a783145" "139" "Resource: Key Facts In Cloud Systems" "design-key-facts"
         "Resource: Key Facts In Cloud Systems" "System Design")

        ("c4429e4fc663ace3097ababa4997eb10" "33" "Resource: Software Design Patterns" "design-ood-patterns"
         "Resource: Software Design Patterns" "System Design")

        ("ec8873c9070037b4e89b6f379dcb4ddb" "34" "Data Structures In System Design" "datastructure-in-design"
         "Data Structures In System Design" "System Design")

        ("b5ae13a821fcb77a3bc03d4d453e0473" "35" "Negotiate For The Offer" "negotiate-offer"
         "Negotiate For The Offer" "System Design")

        ("b2415c09679482b6f52ce9ab53c506a5" "197" "How Slack Sync Your Unread Messages Across Devices" "chat-unread-message"
         "Message delivery problem" "System Design")

        ))
(setq xml-rpc-allow-unicode-string nil)

(setq mywordpress-server-url "https://architect.dennyzhang.com"
      mywordpress-updatemeta-url ""
      mywordpress-username "architecdenny"
      BlOG-TAG "BLOG"
      POST-TAIL (concat "Connect with Denny In <a href='https://linkedin.com/in/dennyzhang001'>LinkedIn</a> Or <a href='https://goo.gl/cZ2Pev'>Slack</a>" google-adsense)
      ORG-CSS-FILE "https://cdn.dennyzhang.com/css/org.css"
      mywordpress-pwd "dennyarchitect123")
;; sophia123

;; --8<-------------------------- separator ------------------------>8--
;; File: wordpress-architect-post.el ends here
