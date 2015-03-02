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

## Scaffold attribute types

There's a type of `boolean`, which I should be using.  Need to destroy and generate the scaffolds, *again*.

List of field types and defaults ([source](https://github.com/rails/rails/blob/67ee6c38b9b112eabe37d5869c23210b9ebf453c/railties/lib/rails/generators/generated_attribute.rb)):

```ruby
def field_type
  @field_type ||= case type
    when :integer, :float, :decimal then :text_field
    when :time                      then :time_select
    when :datetime, :timestamp      then :datetime_select
    when :date                      then :date_select
    when :text                      then :text_area
    when :boolean                   then :check_box
    else
      :text_field
  end
end

def default
  @default ||= case type
    when :integer                     then 1
    when :float                       then 1.5
    when :decimal                     then "9.99"
    when :datetime, :timestamp, :time then Time.now.to_s(:db)
    when :date                        then Date.today.to_s(:db)
    when :string                      then "MyString"
    when :text                        then "MyText"
    when :boolean                     then false
    when :references, :belongs_to     then nil
    else
      ""
  end
end
```

----

# Days as bits

----

## Days to bits

```ruby
2.2.0 :001 > a=18
 => 18 
2.2.0 :002 > (a).to_s(2)
 => "10010" 

2.2.0 :003 > 128.to_s(2)
 => "10000000" 
2.2.0 :004 > 128.modulo(2)
 => 0 

2.2.0 :005 > 127.to_s(2)
 => "1111111" 
2.2.0 :006 > 127.modulo(2)
 => 1 

2.2.0 :007 > (a).to_s(2)
 => "10010"
2.2.0 :008 > (a >> 1).to_s(2)
 => "1001" 
2.2.0 :009 > (a >> 2).to_s(2)
 => "100" 
2.2.0 :010 > (a >> 3).to_s(2)
 => "10" 
2.2.0 :011 > (a >> 4).to_s(2)
 => "1" 
```

So, if we have an integer 0-128, it will represent every possible combination of days in the week that a course might meet.

If we set Monday as the first bit, then the bits are: `USFHWTM`, in other words {Sun}{Sat}{Fri}{Thu}{Wed}{Tue}{Mon}.  So, for an integer of 5:

* `5.to_s(2) => "101"`

Which means the class meets Mondays and Wednesdays:

| U | S | F | H | W | T | M |
|---|---|---|---|---|---|---|
|   |   |   |   | 1 | 0 | 1 |

### Methods

Basic (ugly) method for checking if a day's bit is true for a given integer:

```ruby
def check_day(meet_days_integer,day_to_check)

  day_shift = {monday: 0, tuesday: 1, wednesday: 2, thursday: 3, friday: 4, saturday: 5, sunday:6}

  day_shift_int = day_shift[day_to_check].to_i
  shifted_int = ( meet_days_integer >> day_shift_int ).to_s(2)
  day_checked = shifted_int.to_i % 2
  return day_checked.to_s
end
```

* Notes
  * As it stands, the method expects `day_to_check` to be passed as a symbol; use `.to_sym`.
    * Should probably do that in the method
  * It returns a string, either "`1`" or "`0`"
    * Should probably return boolean true/false

### Views

A quick way to transform from check-boxes to an integer:

Make each day's check-box have the integer value of its bit.  Sum all the checked boxes and return the summed integer.

In other words:

* Monday=1
* Tuesday=2
* Wednesday=4
* Thursday=8
* Friday=16
* Saturday=32
* Sunday=64

In Ruby on Rails, where is the easiest place to do the math?  Javascript in the View?  Or something in the… Controller?  Model?




