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

## Making and breaking scaffolds

Apparently you can't make any `scaffolds` before you run `rake db:migrate`.  (Or not?  I made a lot of wrong turns, so I'm not sure what's peculiar to my experiences here.)

On a related note: here's another possibly useful command: `rails destroy scaffold <name>`.  It removes all the files created by `rails generate scaffold <name>`.

But to undo even more fundamental damage, remove/recreate the whole database.

* `rake db:drop`
* `rake db:create`
* `rails generate scaffold <name> <field>:<type> <field>:<type> <field>:<type>`
* `rake db:migrate`

Why did I do all that?

Because you can't have hyphens in names.  Took me an hour to realize that.  Bother.

## Deleting a scaffold & table

There's probably a better way, but this seemed to work.

First I ran &ldquo;`rails destroy scaffold <name>`&rdquo;

Then I editted `db/schema.rb` and removed the stanza:

```ruby
create_table "<name>"…
  …
end
```

Then I ran &ldquo;`rake db:reset`&rdquo;.

All gone.
