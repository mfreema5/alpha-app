# Notes

Various things along the way.

----

## Setting remote for branches

```bash
$ git branch -u dev
error: the requested upstream branch 'dev' does not exist
hint: 
hint: If you are planning on basing your work on an upstream
hint: branch that already exists at the remote, you may need to
hint: run "git fetch" to retrieve it.
hint: 
hint: If you are planning to push out a new local branch that
hint: will track its remote counterpart, you may want to use
hint: "git push -u" to set the upstream config as you push.
```

Thanks for the hint!  It does not work:

```bash
$ git push -u
fatal: The current branch dev has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin dev
```

Maybe I need to specifiy the remote? 

NOPE:

```bash
$ git push -u origin
fatal: The current branch dev has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin dev
```

So very nice when the documentation doesn't match reality.  Not in the least bit frustrating.

The recommend “`git push --set-upstream origin dev`” worked.

Should I have done “`git branch -u origin dev`”?

Nope.  This seems to work:
```bash
$ git branch dev2
$ git branch -u origin dev2

Branch dev2 set up to track remote branch master from origin.
```

So, the process that works is one that I can not find *anywhere* in the documentation.  Thanks for the help, guys!

Git seems awesome in function; the Git documentation **BLOWS**.
