-- in ~/.config/nvim/lua/snippets/c.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("c", {
    s("main", {
        t({"#include <stdio.h>", "", "int main(){"}),
        t({"", "  "}), i(0),  -- cursor ends here
        t({"", "  return 0;", "}"}),
    }),
})
