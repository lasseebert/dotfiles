vim.pack.add({ 'https://github.com/MagicDuck/grug-far.nvim' })

require('grug-far').setup({
  debounceMs = 500,
  minSearchChars = 2,
  maxSearchMatches = 2000,
  maxLineLength = 1000,
  breakindentopt = 'shift:6',
  normalModeSearch = false,
  searchOnInsertLeave = false,
  maxWorkers = 4,
  -- Deprecated default aliases. Use engines.ripgrep.path and engines.ripgrep.extraArgs.
  -- rgPath = 'rg',
  -- extraRgArgs = '',

  enabledEngines = { 'ripgrep', 'astgrep', 'astgrep-rules' },
  engines = {
    ripgrep = {
      path = 'rg',
      extraArgs = '',
      showReplaceDiff = true,
      placeholders = {
        enabled = true,
        search = 'e.g. foo   foo([a-z0-9]*)   fun\\(',
        replacement = 'e.g. bar   ${1}_foo   $$MY_ENV_VAR ',
        replacement_lua = 'e.g. if vim.startsWith(match, "use") \\n then return "employ" .. match \\n else return match end',
        replacement_vimscript = 'e.g. return "bob_" .. match',
        filesFilter = 'e.g. *.lua   *.{css,js}   **/docs/*.md   (specify one per line)',
        flags = 'e.g. --help --ignore-case (-i) --replace= (empty replace) --multiline (-U)',
        paths = 'e.g. /foo/bar   ../   ./hello\\ world/   ./src/foo.lua   ~/.config',
      },
      defaults = {
        search = nil,
        replacement = nil,
        filesFilter = nil,
        flags = nil,
        paths = nil,
      },
    },

    astgrep = {
      path = 'ast-grep',
      extraArgs = '',
      placeholders = {
        enabled = true,
        search = 'e.g. $A && $A()   foo.bar($$$ARGS)   $_FUNC($_FUNC)',
        replacement = 'e.g. $A?.()   blah($$$ARGS)',
        replacement_lua = 'e.g. return vars.A == "blah" and "foo(" .. table.concat(vars.ARGS, ", ") .. ")" or match',
        replacement_vimscript = 'e.g. return "bob_" .. match',
        filesFilter = 'e.g. *.lua   *.{css,js}   **/docs/*.md   (specify one per line, filters via ripgrep)',
        flags = 'e.g. --help (-h) --debug-query=ast --rewrite= (empty replace) --strictness=<STRICTNESS>',
        paths = 'e.g. /foo/bar   ../   ./hello\\ world/   ./src/foo.lua   ~/.config',
      },
      defaults = {
        search = nil,
        replacement = nil,
        filesFilter = nil,
        flags = nil,
        paths = nil,
      },
    },

    ['astgrep-rules'] = {
      path = 'ast-grep',
      extraArgs = '',
      languageGlobs = {},
      placeholders = {
        enabled = true,
        rules = 'e.g. id: my_rule_1 \\n language: lua\\nrule: \\n  pattern: await $A',
        filesFilter = 'e.g. *.lua   *.{css,js}   **/docs/*.md   (specify one per line, filters via ripgrep)',
        flags = 'e.g. --help (-h) --debug-query=ast --strictness=<STRICTNESS>',
        paths = 'e.g. /foo/bar   ../   ./hello\\ world/   ./src/foo.lua   ~/.config',
      },
      defaults = {
        rules = nil,
        filesFilter = nil,
        flags = nil,
        paths = nil,
      },
    },
  },

  engine = 'ripgrep',
  enabledReplacementInterpreters = { 'default', 'lua', 'vimscript' },
  replacementInterpreter = 'default',
  windowCreationCommand = 'tabedit',
  disableBufferLineNumbers = true,

  helpLine = {
    enabled = true,
  },

  maxSearchCharsInTitles = 30,
  staticTitle = nil,
  startInInsertMode = true,
  startCursorRow = 1,
  wrap = true,
  showCompactInputs = false,
  showInputsTopPadding = true,
  showInputsBottomPadding = true,
  showStatusIcon = true,
  showEngineInfo = true,
  showStatusInfo = true,

  onStatusChange = function(buf)
    local win = vim.fn.bufwinid(buf)
    vim.fn.win_execute(win, 'redrawstatus')
  end,

  onStatusChangeThrottleTime = 500,
  transient = false,
  backspaceEol = true,
  -- Deprecated default alias. Use visualSelectionUsage.
  -- ignoreVisualSelection = false,
  visualSelectionUsage = 'prefill-search',

  keymaps = {
    replace = { n = '<localleader>r' },
    qflist = { n = '<localleader>q' },
    syncLocations = { n = '<localleader>s' },
    syncLine = { n = '<localleader>l' },
    close = { n = '<localleader>c' },
    historyOpen = { n = '<localleader>t' },
    historyAdd = { n = '<localleader>a' },
    refresh = { n = '<localleader>f' },
    openLocation = { n = '<localleader>o' },
    openNextLocation = { n = '<down>' },
    openPrevLocation = { n = '<up>' },
    gotoLocation = { n = '<enter>' },
    pickHistoryEntry = { n = '<enter>' },
    abort = { n = '<localleader>b' },
    help = { n = 'g?' },
    toggleShowCommand = { n = '<localleader>w' },
    swapEngine = { n = '<localleader>e' },
    previewLocation = { n = '<localleader>i' },
    swapReplacementInterpreter = { n = '<localleader>x' },
    applyNext = { n = '<localleader>j' },
    applyPrev = { n = '<localleader>k' },
    syncNext = { n = '<localleader>n' },
    syncPrev = { n = '<localleader>p' },
    syncFile = { n = '<localleader>v' },
    nextInput = { n = '<tab>' },
    prevInput = { n = '<s-tab>' },
  },

  resultsSeparatorLineChar = '─',
  resultsHighlight = true,
  inputsHighlight = true,

  lineNumberLabel = function(params, options)
    local width = math.max(params.max_line_number_length, 3)
    local lineNumbersEllipsis = options.icons.enabled and options.icons.lineNumbersEllipsis or ' '
    return {
      {
        params.line_number and ('%' .. width .. 's '):format(params.line_number)
          or (
            (' '):rep(width - vim.fn.strwidth(lineNumbersEllipsis))
            .. lineNumbersEllipsis
            .. ' '
          ),
        params.is_current_line and 'GrugFarResultsCursorLineNo' or 'GrugFarResultsLineNr',
      },
    }
  end,

  filePathConceal = function(params)
    local len = #params.file_path
    local window_width = params.window_width - 8
    if len < params.window_width then
      return
    end

    local first_part_len = math.floor(window_width / 3)
    local delta = len - window_width

    return first_part_len, first_part_len + delta
  end,

  filePathConcealChar = '…',
  spinnerStates = {
    '󱑋 ',
    '󱑌 ',
    '󱑍 ',
    '󱑎 ',
    '󱑏 ',
    '󱑐 ',
    '󱑑 ',
    '󱑒 ',
    '󱑓 ',
    '󱑔 ',
    '󱑕 ',
    '󱑖 ',
  },
  reportDuration = true,

  icons = {
    enabled = true,
    fileIconsProvider = 'first_available',
    actionEntryBullet = ' ',
    searchInput = ' ',
    replaceInput = ' ',
    filesFilterInput = ' ',
    flagsInput = '󰮚 ',
    pathsInput = ' ',
    resultsStatusReady = '󱩾 ',
    resultsStatusError = ' ',
    resultsStatusSuccess = '󰗡 ',
    resultsActionMessage = '  ',
    resultsEngineLeft = '⟪',
    resultsEngineRight = '⟫',
    resultsChangeIndicator = '┃',
    resultsAddedIndicator = '▒',
    resultsRemovedIndicator = '▒',
    resultsDiffSeparatorIndicator = '┊',
    historyTitle = '   ',
    helpTitle = ' 󰘥  ',
    lineNumbersEllipsis = ' ',
    newline = ' ',
  },

  prefills = {
    search = nil,
    replacement = nil,
    filesFilter = nil,
    flags = nil,
    paths = nil,
  },

  history = {
    maxHistoryLines = 10000,
    historyDir = vim.fn.stdpath('state') .. '/grug-far',
    autoSave = {
      enabled = true,
      onReplace = true,
      onSyncAll = true,
      onBufDelete = true,
    },
  },

  pathProviders = {
    ['buflist'] = function()
      return require('grug-far.pathProviders').getBuflistFiles()
    end,
    ['buflist-cwd'] = function()
      return require('grug-far.pathProviders').getBuflistFilesInCWD()
    end,
    ['qflist'] = function()
      return require('grug-far.pathProviders').getQuickfixListFiles()
    end,
    ['loclist'] = function(opts)
      return require('grug-far.pathProviders').getLoclistFiles(opts.prevWin)
    end,
  },

  instanceName = nil,

  folding = {
    enabled = true,
    foldlevel = 1,
    foldcolumn = '1',
    include_file_path = false,
  },

  resultLocation = {
    showNumberLabel = true,
    numberLabelPosition = 'right_align',
    numberLabelFormat = ' [%d]',
  },

  openTargetWindow = {
    exclude = {},
    preferredLocation = 'left',
    useScratchBuffer = true,
  },

  helpWindow = {},
  historyWindow = {},
  previewWindow = {},
  smartInputHandling = true,

  hooks = {
    on_before_edit_file = nil,
  },
})

vim.keymap.set('n', '<leader>sR', '<cmd>GrugFar<cr>', { desc = '[S]earch [R]eplace' })
