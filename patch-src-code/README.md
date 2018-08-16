Patched

- org-md-link function

```
bash-3.2$  diff ./ox-md.el ./ox-md-patch.el 
58c58
< 	(format "![img](%s)"
---
> 	(format "%s"
74c74
< 	  (if (not contents) (format "<%s>" path)
---
> 	  (if (not contents) (format "%s" path)
```

