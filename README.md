# Docsearch-scraper-action

This is a Github action used to generate an _Algolia_ index from a website using
[docsearch-scraper](https://github.com/algolia/docsearch-scraper). 

You can also run any `./docsearch` command available.

## Usage

Executes a `docsearch` command.

```
action "Generate index" {
  uses = "Embraser01/docsearch-scraper-action@master"
  args = ["run /github/workspace/algolia-config.json"]
  secrets = ["API_KEY", "APPLICATION_ID"]
}
```

You should note that the command will be executed from `/root/docsearch-scraper` and not from
the Github workspace.


Another note: The action will not commit config file (`nb_hits` is updated on run). You'll have
to add another action to do it.
