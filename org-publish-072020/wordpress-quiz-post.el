;; -*- coding: utf-8 -*-
;; File: wordpress-quiz-post.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-02-03 15:37:46>
;; --8<-------------------------- separator ------------------------>8--
(setq list-post-meta
      ;; title-md5, post-id, post-title, blog-uri, meta-description, keywords
      '(
        ("aaaaae9ece5a312f25446aa2b7b127f3" "27" "test" "mytest"
         "" "Quiz For Kubernetes")

        ("aaaaae9ece5a312f25446aa2b7b127f3" "25" "test" "mytest"
         "" "Quiz For Kubernetes")

        ("aaaaae9ece5a312f25446aa2b7b127f3" "23" "test" "mytest"
         "" "Quiz For Kubernetes")

        ("aaaaae9ece5a312f25446aa2b7b127f3" "1" "test" "mytest"
         "" "Quiz For Kubernetes")

        ("b8d9508470dc1ab8c3d1af6eec534611" "11" "Quiz: Common Usage Of Kubernetes Deployment" "kubernetes-deployment"
         "" "Quiz For Kubernetes")

        ("d9d6de593260e02ba056c4b91aa45de9" "9" "Quiz: Get Familiar With Kubernetes Storage" "kubernetes-storage"
         "" "Quiz For Kubernetes")

        ("aaaaae9ece5a312f25446aa2b7b127f3" "13" "Understanding Of Kubernetes Concepts" "mytest"
         "" "Quiz For Kubernetes")
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ("4c49be2a9b743d2f3c349016323cf69d" "7" "Quiz: Understanding Of Kubernetes Concepts" "quiz-k8s-concept"
         "" "Quiz For Kubernetes")

        ("550b824ac31a438ba279293150412aa8" "5" "Contact" "contact"
         "" "Quiz")
        ))
(setq xml-rpc-allow-unicode-string nil)

(setq mywordpress-server-url "https://quiz.dennyzhang.com"
      mywordpress-updatemeta-url ""
      mywordpress-username "quizdenny"
      BlOG-TAG "BLOG"
      POST-TAIL (concat "Connect with Denny In <a href='https://linkedin.com/in/dennyzhang001'>LinkedIn</a> Or <a href='https://goo.gl/cZ2Pev'>Slack</a>" google-adsense)
      ORG-CSS-FILE "https://cdn.dennyzhang.com/css/org-quiz.css"
      mywordpress-pwd "sophiaDenny123")
