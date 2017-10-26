# git-db

Rebase dependent git branches.

Suppose you're happily hacking away, creating branches that depend on old
branches, little by little. Then WHAM, someone commits to master and you think
to yourself, dang, self, that's a nice commit right there, I sure would like
such a commit in my history. but, :( , it is not in your history.

In visual form:

```
* ee6215d50 - (23 hours ago) wip - Daniel King (HEAD -> dk4)
* 2335c6c36 - (23 hours ago) wip - Daniel King (dk3)
* 5ea1497bc - (25 hours ago) wip - Daniel King
* d3b6d278e - (25 hours ago) wip - Daniel King
* 6a2f1d0f6 - (25 hours ago) fix up - Daniel King (dk2)
* 7005f8547 - (25 hours ago) wip - Daniel King
* 20d144893 - (25 hours ago) wip - Daniel King
* d2f615dad - (29 hours ago) wip - Daniel King
* 9429341fe - (31 hours ago) wip - Daniel King
* cfcd55442 - (6 days ago) wip - Daniel King
* 8f85c6c01 - (2 days ago) allow creation of arrayInfo from element TypeInfo - Daniel King (hi/dk, dk)
| * a1d4e7a90 - (56 minutes ago) Fixed ImputePlinkSuite (#2363) - jigold (hi/master, master)
|/
* ee62b34d8 - (61 minutes ago) code improvements (#2346) - Daniel King
```

execute:
```
git-db.sh master 'dk^' dk dk2 dk3 dk4
```

and now it looks like:

```
* 0ebb25b3f - (23 hours ago) wip - Daniel King (HEAD -> dk4)
* d0d83b3c0 - (23 hours ago) wip - Daniel King (dk3)
* e5c916673 - (25 hours ago) wip - Daniel King
* 8c6347095 - (25 hours ago) wip - Daniel King
* f234c20fd - (25 hours ago) fix up - Daniel King (dk2)
* a85493a6d - (25 hours ago) wip - Daniel King
* 2b02e14d3 - (26 hours ago) wip - Daniel King
* dfecea647 - (29 hours ago) wip - Daniel King
* bbbc14867 - (32 hours ago) wip - Daniel King
* 340167153 - (6 days ago) wip - Daniel King
* fd3c8ba45 - (2 days ago) allow creation of arrayInfo from element TypeInfo - Daniel King (dk)
* a1d4e7a90 - (64 minutes ago) Fixed ImputePlinkSuite (#2363) - jigold (hi/master, master)
* ee62b34d8 - (61 minutes ago) code improvements (#2346) - Daniel King
```

🎉
