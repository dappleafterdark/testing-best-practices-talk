- DHH Disclaimer:  this advice comes from our experience building APIs

- TDD, outside in.

- Testing tweet
```
.--------------------------------------------------.
|Mark Lorenz                                 28-Mar|
|@Soodesune                                        |
|                                                  |
|  Software testing: immediately introduces a 2nd  |
|  collaborating object to the system, forcing you |
|  to think about the "api" and interactions. 😍    |
|                                                  |
|/Soodesune/status/449543530176720896              |
*--------------------------------------------------*
```

- Features that give you free stuff later shoud still force you to write a test later.
  - https://git.innova-partners.com/cmm/forms-api/blob/master/app/controllers/forms_controller.rb#L44
  - If you must, use Liskov Substitution:
    - https://git.innova-partners.com/cmm/requests-api/blob/master/spec/requests/authentication_spec.rb#L38

- UUIDs in Testing
  - https://git.innova-partners.com/cmm/requests-api/blob/master/spec/requests/request_spec.rb#L86
  - enforcing difference: add one to it.

- Testing for future refactors

- Use the F out of Fetching

- Expectations first, lets last
  - https://git.innova-partners.com/cmm/consumers-api/blob/562887f79a1cefa2e2007abceedf3742865e3877/spec/requests/find_or_create_foreign_users_spec.rb

- re-read the specs during the refactor.  If you can't grok it, it's too complicated.

- Focus on informative failure diffs
  - stay away from `should be_success` prefer `expect(http.status.to_i).to eq(200)`
  - https://git.innova-partners.com/cmm/consumers-api/blob/master/spec/requests/find_or_create_foreign_users_spec.rb#L18
  - `match_array`

- Fail fast
  - `create!`
  - `fail "why is there more than one?!" if records.size > 1; records.first`
  - You don't deserve a green dot for that
  - https://git.innova-partners.com/cmm/consumers-api/blob/master/spec/requests/find_or_create_foreign_users_spec.rb#L41

- Organization
  - One file for the happy path
  - One file for each sad path
    - Sue hacking Alice

- No factories.

```bash
alias rspec="rspec  --require=support/formatters/vim_formatter.rb --format VimFormatter --out quickfix.out --format NyanCatFormatter --order=1"
```
