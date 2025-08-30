;; -*- coding: utf-8 -*-
;; File: wordpress-architect-post.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-02-17 16:22:30>
;; --8<-------------------------- separator ------------------------>8--
(setq list-post-meta
      ;; title-md5, post-id, post-title, blog-uri, meta-description, keywords
      '(
        ("XXX" "85" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "208" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "107" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "87" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "652" "TestSubject" "test"
         "TestSubject" "System Design")
        
        ("XXX" "654" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "656" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "658" "TestSubject" "test"
         "TestSubject" "System Design")
        
        ("XXX" "660" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "662" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "664" "TestSubject" "test"
         "TestSubject" "System Design")
        
        ("XXX" "666" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "668" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "670" "TestSubject" "test"
         "TestSubject" "System Design")
        
        ("XXX" "672" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "674" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "676" "TestSubject" "test"
         "TestSubject" "System Design")
        
        ("XXX" "678" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "680" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "682" "TestSubject" "test"
         "TestSubject" "System Design")
        
        ("XXX" "684" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "686" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "690" "TestSubject" "test"
         "TestSubject" "System Design")
        
        ("XXX" "692" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "700" "TestSubject" "test"
         "TestSubject" "System Design")

        ("XXX" "702" "TestSubject" "test"
         "TestSubject" "System Design")

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ("97757765c989e8f37118606c4ac64525" "650" "Deep Dive Into TCP/UDP Protocol" "explain-tcp-udp"
         "Deep Dive Into TCP/UDP Protocol" "System Design")

        ("b5c081225939f757531f278dfdb04e9a" "190" "Design: Design a logging & metrics system" "design-logging"
         "Design logging metrics" "System Design")

        ("9ffa7c85f62d004d52bcc35f53079bb2" "189" "Design: Data Synchronization Service" "design-sync"
         "Data Synchronization Service" "System Design")

        ("9e16b86d745ce33530d5fa5efeeb6491" "648" "Design: Leaderboard" "design-leaderboard"
         "Design: Leaderboard" "System Design")

        ("e014ec896a693185f778caa54288e5ef" "646" "Design: Twitter News Feed" "design-news-feed"
         "Design: Twitter News Feed" "System Design")

        ("813552194d87bec63cf2d9392e8cd9a4" "644" "Explain Bloom Filter" "explain-bloomfilter"
         "Explain Bloom Filter" "System Design")

        ("e42954b5373869812519deb8a9f1ad5c" "198" "Design: A Thread-safe Hashmap" "design-concurrent-hashmap"
         "Design: A Thread-safe Hashmap" "System Design")

        ("3e81af7bfa65a9832acef2ccff43297e" "199" "Explain SSTable (Sorted Strings Table)" "explain-sstable"
         "Explain SSTable (Sorted Strings Table)" "System Design")

        ("2980800ec5c1d3cd9623d053a00a6039" "200" "Explain Delayed Queue" "explain-delayedqueue"
         "Explain Delayed Queue" "System Design")

        ("9d3d612fcdfad53994377323e763e4ec" "201" "Deep Dive Into Memory Management" "explain-memory-management"
         "Deep Dive Into Memory Management" "System Design")

        ("63fdbe365be7785cca675d2bc3921984" "109" "Deep Dive Into HTTP Protocol" "explain-http"
         "Deep Dive Into HTTP Protocol" "System Design")

        ("516ce4aa34cde14e04ea4854ddb11de7" "1" "DB: SQL and NoSQL" "explain-nosql"
         "DB: SQL and NoSQL" "System Design")

        ("cf9c4b622b34689e7449eea08f78457b" "203" "Explain Eventual Consistency" "explain-eventualconsistency"
         "Explain Eventual Consistency" "System Design")

        ("117018daa5d5d040321c06a8bee4fef7" "204" "Explain DB Indexing" "explain-indexing"
         "Explain DB Indexing" "System Design")

        ("65e181363ac826db057b0d02fc73726c" "205" "Explain Data Partition & Sharding" "explain-partition"
         "Explain Data Partition & Sharding" "System Design")

        ("ae7effafd07d98e59f3193e8a7f07618" "206" "Explain Two-phase commit/Three-phase commit" "explain-2pc"
         "Explain Two-phase commit/Three-phase commit" "System Design")

        ("5c125e1e9e0733e6ca752c4736692a27" "207" "Explain LSM (Log Structured Merge Trees)" "explain-lsm"
         "Explain LSM (Log Structured Merge Trees)" "System Design")

        ("2032245c93a58377542b5563d8e65d7c" "209" "Deep Dive Into Apache Kafaka" "design-kafaka"
         "Deep Dive Into Apache Kafaka" "System Design")

        ("838f6897f75ec56eb4126713d785e196" "210" "Deep Dive Into Redis" "design-redis"
         "Deep Dive Into Redis" "System Design")

        ("61076253125d08a66a185293e25a8657" "211" "Explain CRDTs (Conflict-Free Replicated Data Types)" "explain-crdt"
         "Explain CRDT (Conflict-Free Replicated Data Types)" "System Design")

        ("e53b8b90b6ec59fe5f8b024d9cb34a95" "213" "Explain: Monitoring System" "explain-monitoring"
         "Explain: Monitoring System" "System Design")

        ("eccc6447f076da546ee4d646be93ca66" "188" "Message Queue For Async Programming" "explain-messagequeue"
         "Message Queue For Async Programming" "System Design")

        ("15ce129f3183651eed81ff0c1a8adb44" "187" "How Heartbeat Work" "explain-heartbeat"
         "How Heartbeat Work" "System Design")

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
        
        ("7cef531131a60f71a6c0e60186995b61" "6" "Contact" "contact"
         "Contact" "System Design")

        ("a1f2ea3747796fadd201f99685f72690" "119" "Deep Dive Into Couchbase System Design" "design-couchbase"
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

        ("0634f998f7e1fabe6d2a5aa5bee1afc1" "108" "Design An API Rate Limiter" "design-api-limiter"
         "Design an API Rate Limiter" "System Design")

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

        ("1df0dc01aa508c3f5cd7fe9330788814" "67" "Explain CAP Theorem" "explain-cap"
         "Explain CAP Theorem" "System Design")

        ("df2d7d7dc36f6a3335885c2c59e6d9d0" "69" "Explain: Pessimistic And Optimistic Locking" "explain-locks"
         "Explain: Pessimistic And Optimistic Locking" "System Design")

        ("d0e5d278a2aed31b5dbfa6841490ae93" "70" "Explain Paxos Algorithm" "explain-paxos"
         "Explain Paxos Algorithm" "System Design")

        ("62e0773325e4f29f190a25cd012dc09c" "71" "Design: A Distributed Lock" "distributed-lock"
         "Design: A Distributed Lock" "System Design")

        ("5801211685ecd966d67b65133d3b93be" "72" "Typical Question: How Does Consistent Hashing Work?" "explain-consistent-hash"
         "Typical Question: How Does Consistent Hashing Work?" "System Design")

        ("21e31f9d98c3c38cb5d4ff0c7f88b0de" "73" "Design: DB Replication" "explain-db-replication"
         "Scale a single-node DB into a cluster with HA" "System Design")

        ("ae177120a2a1328db062f0fbbf6a7874" "74" "Design: How Does DNS Work?" "explain-dns"
         "Design: How Does DNS Work?" "System Design")

        ("0875b068ce6bd299d8aa01ba473f8f4a" "75" "Design: How Does LoadBalancer Work?" "explain-loadbalancer"
         "Design: How Does LoadBalancer Work?" "System Design")

        ("bd4d84024b595e1c602d8f9ab675e403" "76" "Design: Poll vs Push" "explain-poll-push"
         "Design: Poll vs Push" "System Design")

        ("f3a66756062a108d5ec49a06b63f1622" "77" "Design: How Does Caching Work" "explain-cache"
         "Design: How Does Caching Work" "System Design")

        ("e7d401c60a40e768014c231d5c794075" "78" "Explain: Vector Clocks/Version Vectors" "explain-vector-clocks"
         "Explain: Vector Clocks/Version Vectors" "System Design")

        ("33e5f78cffd7bee08b4df026424154b1" "79" "Design: A Distributed Counter" "design-distributed-counter"
         "Design: A Distributed Counter" "System Design")

        ("e3224d757d49b72d0dd6ff55a0c092e7" "80" "Design: What Are Your Experience With Session Design?"
         "explain-session"
         "What Are Your Experience With Session Design?" "System Design")

        ("b3e58f918c22e05be8f79b0dd5f96bc2" "81" "Design: What You Will Do, If Your DB Runs Into Split Brain?"
         "explain-split-brain"
         "Design: What You Will Do, If Your DB Runs Into Split Brain?" "System Design")

        ("663cd3c720ee6ea8c8ac1a039e0e4765" "82" "How To Save Users' Login Credentials In Your DB?"
         "design-store-credential"
         "How To Save Users' Login Credentials In Your DB?" "System Design")
        
        ("dab6dc3d2bbb94cacbf45a539ad81872" "83" "Concurrency & Communication"
         "explain-coordination"
         "Coordination: With Accuracy Improve Performance" "System Design")

        ("ce520ec7d4330a6faa017b133830b180" "138" "Explain: Gossip Protocol" "explain-gossip"
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
      mywordpress-pwd "sophia123")
;; sophia123
