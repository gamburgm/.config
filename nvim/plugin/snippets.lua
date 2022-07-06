local ls = require'luasnip'

-- node types
local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep


ls.config.set_config({
    history = true,
    update_events = "TextChanged,TextChangedI",
})

-- ls.add_snippets("all", {
--   ls.parser.parse_snippet("expand", "-- this is what was expanded!"),
-- })

ls.cleanup()

local MKPE_SNIP = [[(progs-equal?
  ({}
    (generate-prog
      (ir-rel ({})
        {})))
  (generate-prog
    (ir-rel ({})
      {})))
]]


ls.add_snippets("racket", {
    ls.parser.parse_snippet("d", "(define $1 $0)"),
    ls.parser.parse_snippet("df", "(define ($1)\n  $0)"),
    ls.parser.parse_snippet("dl", "(λ ($1) $0)"),
    ls.parser.parse_snippet("dp", "(define+provide ($1) $0)"),

    -- for mK
    s("mkpe", fmt(MKPE_SNIP, { i(1, ""), i(2, ""), i(3, ""), rep(2), rep(3) })),
    ls.parser.parse_snippet("td", "(#%term-datum $0)"),
    ls.parser.parse_snippet("lv", "(#%lv-ref $0)"),
})
