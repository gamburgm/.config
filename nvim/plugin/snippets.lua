local ls = require'luasnip'

ls.config.set_config({
    history = true,
    update_events = "TextChanged,TextChangedI",
})

ls.add_snippets("all", {
  ls.parser.parse_snippet("expand", "-- this is what was expanded!"),
})

