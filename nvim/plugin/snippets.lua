local ls = require'luasnip'

-- node types
local s, i, t = ls.s, ls.insert_node, ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local c = ls.choice_node
local f = ls.function_node
local sn = ls.sn
local d = ls.dynamic_node

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

local same = function(index)
  return f(function(arg)
    -- TODO
    return arg[1]
  end, {index})
end

ls.add_snippets("all", {
    -- s("currtime", f(function() return os.date "%D - %H:%M" end)),
    -- s("sametest", fmt([[example: {}, function: {}]], { i(1), same(1) })),
})

-- ls.add_snippets("lua", {
--     s("req", fmt(
--         [[local {} = require "{}"]],
--         {
--           f(function(import_name)
--               local parts = vim.split(import_name[1][1], ".", true)
--               return parts[#parts] or ""
--             end, { 1 }),
--           i(1)
--         }
--       )
--     ),
-- })

-- local let_row = function(_args)
--   return sn(nil, { t "[", i(1), t "]", c(2, { t "", { t "", d(nil, let_row, {}) }})})
-- end

ls.add_snippets("racket", {
    ls.parser.parse_snippet("d", "(define $0)"),
    ls.parser.parse_snippet("df", "(define ($1)\n  $0)"),
    ls.parser.parse_snippet("dl", "(λ ($1) $0)"),
    ls.parser.parse_snippet("dp", "(define+provide $0)"),
    ls.parser.parse_snippet("dfp", "(define+provide ($1)\n  $0)"),

    -- s("lt", fmt("(let ({})\n  {})", { c(1, { t "", d(nil, let_row, {}) }), i(0) })),


    -- for mK
    s("mkpe", fmt(MKPE_SNIP, { i(1, ""), i(2, ""), i(3, ""), rep(2), rep(3) })),
    ls.parser.parse_snippet("td", "(#%term-datum $0)"),
    ls.parser.parse_snippet("lv", "(#%lv-ref $0)"),
    ls.parser.parse_snippet("str", "(struct $0 #:transparent)"),
})

ls.add_snippets("markdown", {
    s(
      "foob",
      fmt(
        [[
        FOOBAR {{
          {}
        }}
        ]],
        { c(1, { t "GGG", t "OOOOO" }) }
      )
    ),
})

      
