return function()
  -- vim.g.ale_lint_delay = 1
  vim.g.ale_javascript_eslint_use_global = 0
  vim.g.ale_linters = {
    javascript = {'eslint'}
  }
  vim.g.ale_linters['javascript.jsx'] = 'eslint'
  --vim.g.ale_linters['typescript'] = 'eslint'
  vim.g.ale_linters_explicit = 1

  vim.g.ale_lint_on_enter = 1
  vim.g.ale_lint_on_save = 1
  vim.g.ale_lint_on_text_changed = "always"
  vim.g.ale_lint_on_insert_leave = 1


  vim.g.ale_fixers = {
    javascript = {'eslint'}
  }
  --vim.g.ale_fixers['javascript.jsx'] = 'eslint'
  --vim.g.ale_fixers['typescript'] = 'eslint'
  vim.g.ale_fix_on_save = 1

  vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'

  vim.g.ale_sign_error = '█'
  vim.g.ale_sign_warning = '█'
end
