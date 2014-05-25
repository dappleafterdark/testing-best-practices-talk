Introduction:
 - Assumes a TDD work flow (yea, we still do that)
 1. Protecting your specs from stupid (me)
 2. Getting usefull failure messages (NoMethod on nil anyone?)
 3. Pro-tips (next level specs)

```
spec/
├── failing_fast
│   ├── count_surprises_spec.rb
│   └── create_bang_spec.rb
├── informative_failures
│   ├── dont_be_success_spec.rb
│   ├── lists_spec.rb
│   └── use_fetching_spec.rb
└── pro_tips
    └── use_secure_random_spec.rb
```

---
## Running:

```
cd Mememotron
../tty_command.rb ../a-slides-file.yaml
```

In a separate terminal window, use the `kill` command that's been put into your clipboard to advance the presentation
```
kill -s USR1 60776  # just an example
```
