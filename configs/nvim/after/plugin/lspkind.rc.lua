local status, lspkind = pcall(require, "lspkind")
if (not status) then return end

lspkind.init({
  -- enables text annotations
  --
  -- default: true
  mode = 'symbol_text',

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = 'codicons',

  -- override preset symbols
  --
  -- default: {}
  symbol_map = {
    Text = "󰊄",
    Method = "µ",
    Function = "ƒ",
    Constructor = "",
    Field = "",
    Variable = "󰫧",
    Class = "",
    Interface = "¡",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "󰌆",
    Snippet = "≠",
    Color = "",
    File = "",
    Reference = "®",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "%",
    TypeParameter = ""
  },
})
