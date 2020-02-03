;; -*- coding: utf-8 -*-
;; File: wordpress-tax-post.el
;;
;; Author: Denny Zhang(https://www.dennyzhang.com/contact)
;; Copyright 2020, https://DennyZhang.com
;; Created:2008-10-01
;; Updated: Time-stamp: <2020-02-03 15:37:43>
;; --8<-------------------------- separator ------------------------>8--
(setq list-post-meta
      ;; title-md5, post-id, post-title, post-slug, post-meta, keywords
      '(
        ("2cc1943d4c0b46bfcf503a75c44f988b" "80" "Popular" "popular"
         "Popular" "All popular blog posts are aggregated by Popular tag. Like most blogs, we can browser posts by tag, category or search" "Popular Post")

        ("bbaff12800505b22a853e8b7f4eb6a22" "83" "Contact" "contact"
         "Contact" "Contact usashui.com" "Contact USA Tax shui")

        ("8625e1de7be14c39b1d14dc03d822497" "86" "Tools" "tools"
         "Tools" "Here I recommend tools and services, which I heavily use everyday." "USA Tax shui Tool")

        ("992a0f0542384f1ee5ef51b7cf4ae6c4" "89" "Services" "services"
         "Services" "Here I maintain a list of free or premium online service for my audience." "USA Tax shui  Online Services")

        ("4c585960bb81d82f91d7260369311a6f" "4" "Tax Intro: 美国税简介" "tax_intro"
         "Tax Intro: 美国税简介" "在美国，每年每人都需要缴纳联邦税、州税、社会保险税和医疗服务税。" "Federal Income Tax")

        ("e482ee71df216805c0bff25a3febec51" "7" "H1B Extra Income: H1B做兼职" "h1b_partime"
         "H1B Extra Income: H1B做兼职" "简单来说，H1B是不能开副业的。Fulltime之后的，兼职（劳务性收入型）是不允许的。哪怕是做电商，做广告流量都是不行的。但是，你可以有投资性收入，例如: 买股票, 做airbnb, 或出租房子等等。

但这是为什么呢？来，我们来一起理理。" "H1B Tax")

        ("384468f41d3f180cea4736483b8f8b1d" "22" "Money Transfer: 从国内向美国汇款" "transfer_money"
         "Money Transfer: 从国内向美国汇款" "卖了国内房子过来付首付？父母资助一些钱怎么汇到美国来？

当然, 我们想避免不必要的法务风险。同时能降低相关的资金损耗。

我应该怎么汇钱呢？" "H1B Tax")

        ("3d1357ca59e50b7916d8ab6d662f79f5" "25" "H4/H1B Startup: H签证开公司" "h4_startup"
         "H4/H1B Startup: H签证开公司" "简单来说，H1B是不能开副业的。Fulltime之后的，兼职（劳务性收入型）是不允许的。哪怕是做电商，做广告流量都是不行的。但是，你可以有投资性收入，例如: 买股票, 做airbnb, 或出租房子等等。

但这是为什么呢？来，我们来一起理理。" "H1B Tax")

        ("07123675d5a9092f680b50f648964f50" "28" "Employee Tax: 全职员工的税项" "w2_tax"
         "Employee Tax: 全职员工的税项" "简单来说，H1B是不能开副业的。Fulltime之后的，兼职（劳务性收入型）是不允许的。哪怕是做电商，做广告流量都是不行的。但是，你可以有投资性收入，例如: 买股票, 做airbnb, 或出租房子等等。

但这是为什么呢？来，我们来一起理理。" "H1B Tax")

        ("fdf506643c9c5f98474e9c69c3214313" "32" "W2 VS 1099: 做Employee, 还是做contractor?" "w2_vs_1099"
         "W2 VS 1099: 做Employee, 还是做contractor?" "简单来说，H1B是不能开副业的。Fulltime之后的，兼职（劳务性收入型）是不允许的。哪怕是做电商，做广告流量都是不行的。但是，你可以有投资性收入，例如: 买股票, 做airbnb, 或出租房子等等。

但这是为什么呢？来，我们来一起理理。" "H1B Tax")

        ("7233454e47c62f595cc7608eb6b8e4c2" "35" "Home Deduction: H1B在家办公如何拿home office抵税" "home_deduction"
         "Home Deduction: H1B在家办公如何拿home office抵税" "简单来说，H1B是不能开副业的。Fulltime之后的，兼职（劳务性收入型）是不允许的。哪怕是做电商，做广告流量都是不行的。但是，你可以有投资性收入，例如: 买股票, 做airbnb, 或出租房子等等。

但这是为什么呢？来，我们来一起理理。" "H1B Tax")

        ("298cb0e0cd666e7a231b3d2c4f978870" "38" "Foreign Contractor: 在美国如何从中国雇佣兼职" "foreign_contractor"
         "Foreign Contractor: 在美国如何从中国雇佣兼职" "简单来说，H1B是不能开副业的。Fulltime之后的，兼职（劳务性收入型）是不允许的。哪怕是做电商，做广告流量都是不行的。但是，你可以有投资性收入，例如: 买股票, 做airbnb, 或出租房子等等。

但这是为什么呢？来，我们来一起理理。" "H1B Tax")

        ;; 1648 mytest
        ))

(setq xml-rpc-allow-unicode-string nil)

(setq mywordpress-server-url "http://www.usashui.com"
      mywordpress-updatemeta-url (concat mywordpress-server-url "/wp-content/themes/portfolio-press/updatemeta.php")
      mywordpress-username "dennyzhang"
      BlOG-TAG "BLOG"
      ORG-CSS-FILE "https://cdn.dennyzhang.com/css/org.css"
      mywordpress-pwd "Mark.filebat2")
;; --8<-------------------------- separator ------------------------>8--
;; File: wordpress-tax-post.el ends here
