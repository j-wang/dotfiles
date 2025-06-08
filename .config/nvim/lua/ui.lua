-- Set diagnostic icons in the sign column (gutter)
local signs = {
  Error = { icon = "", hl = "DiagnosticSignError" },
  Warn  = { icon = "", hl = "DiagnosticSignWarn"  },
  Hint  = { icon = "", hl = "DiagnosticSignHint"  },
  Info  = { icon = "", hl = "DiagnosticSignInfo"  },
}

for type, sign in pairs(signs) do
  vim.api.nvim_set_hl(0, sign.hl, { default = true, link = sign.hl })  -- Ensures highlighting exists
  vim.fn.sign_define(sign.hl, { text = sign.icon, texthl = sign.hl, numhl = "" })
end
