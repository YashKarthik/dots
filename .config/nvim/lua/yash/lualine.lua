
-- Tokyonight
-- local colors = {
--     grey = '#292e42',
--     light_grey = '#414868',
--     black = '#15161e',
--     white = '#c0caf5',
--     red = '#f7768e',
--     orange = '#e0af68',
--     green = '#9ece6a',
--     light_green = '#73daca',
--     purple = '#bb9af7',
--     blue = '#7aa2f7',
--     light_blue = '#7dcfff',
-- }

-- Rose Pine Moon colors
-- local colors = {
--     base = "#232136",
--     surface = "#2a273f",
--     overlay = "#393552",
--     muted = "#6e6a86",
--     subtle = "#908caa",
--     text = "#e0def4",
--     love = "#eb6f92",
--     gold = "#f6c177",
--     rose = "#ea9a97",
--     pine = "#3e8fb0",
--     foam = "#9ccfd8",
--     iris = "#c4a7e7",
--     highlightLow = "#2a283e",
--     highlightMed = "#44415a",
--     highlightHigh = "#56526e",
-- }

-- local p = require('rose-pine.palette')
--local myCustomRosePineMoon = {
--    normal = {
--        a = { bg = colors.gold, fg = colors.base },
--        b = { bg = colors.overlay, fg = colors.rose },
--        c = { bg = colors.surface, fg = colors.text },
--    },
--    insert = {
--        a = { bg = colors.foam, fg = colors.base },
--        b = { bg = colors.overlay, fg = colors.foam },
--        c = { bg = colors.surface, fg = colors.text },
--    },
--    visual = {
--        a = { bg = colors.iris, fg = colors.base },
--        b = { bg = colors.overlay, fg = colors.iris },
--        c = { bg = colors.surface, fg = colors.text },
--    },
--    replace = {
--        a = { bg = colors.pine, fg = colors.base },
--        b = { bg = colors.overlay, fg = colors.pine },
--        c = { bg = colors.surface, fg = colors.text },
--    },
--    command = {
--        a = { bg = colors.rose, fg = colors.base },
--        b = { bg = colors.overlay, fg = colors.love },
--        c = { bg = colors.surface, fg = colors.text },
--    },
--    inactive = {
--        a = { bg = colors.base, fg = colors.muted },
--        b = { bg = colors.base, fg = colors.muted },
--        c = { bg = colors.surface, fg = colors.text },
--    },
--}

-- melange
--local colors = {
--    bg = "#292522",
--    fg = "#ECE1D7",
--    bright_black = "#867462",
--    bright_blue = "#A3A9CE",
--    bright_cyan = "#89B3B6",
--    bright_green = "#85B695",
--    bright_magenta = "#CF9BC2",
--    bright_red = "#D47766",
--    bright_white = "#ECE1D7",
--    bright_yellow = "#EBC06D",
--    dark_black = "#292522",
--    dark_blue = "#273142",
--    dark_cyan = "#253333",
--    dark_green = "#233524",
--    dark_magenta = "#422741",
--    dark_red = "#7D2A2F",
--    dark_white = "#403A36",
--    dark_yellow = "#8B7449",
--    black = "#34302C",
--    blue = "#7F91B2",
--    cyan = "#7B9695",
--    green = "#78997A",
--    magenta = "#B380B0",
--    red = "#BD8183",
--    white = "#C1A78E",
--    yellow = "#E49B5D"
--}

--local bg = vim.opt.background:get()
--local palette = require('melange/palettes/' .. bg)
--
--local a = palette.a -- Grays
--local b = palette.b -- Bright foreground colors
--local c = palette.c -- Foreground colors
--local d = palette.d -- Background colors
--
--local myMelange = {}
--
--local insert_blue = '#9999BB'
--
-- myMelange.normal = {
--   a = { bg = a.com, fg = a.bg },
--   b = { bg = colors.dark_white, fg = a.com },
--   c = { bg = a.float, fg = a.com },
-- }
-- 
-- myMelange.insert = {
--   a = { bg = insert_blue, fg = a.bg },
--   b = { bg = colors.dark_white, fg = insert_blue },
--   c = { bg = a.float, fg = insert_blue },
-- }
-- 
-- myMelange.command = {
--   a = { bg = c.yellow, fg = a.bg },
--   b = { bg = colors.dark_white, fg = c.yellow },
--   c = { bg = a.float, fg = c.yellow },
-- }
-- 
-- myMelange.visual = {
--   a = { bg = c.magenta, fg = a.bg },
--   b = { bg = colors.dark_white, fg = c.magenta },
--   c = { bg = a.float, fg = c.magenta },
-- }
-- 
-- myMelange.replace = {
--   a = { bg = c.green, fg = a.bg },
--   b = { bg = colors.dark_white, fg = c.green },
--   c = { bg = a.float, fg = c.green },
-- }
-- 
-- myMelange.terminal = {
--   a = { bg = c.yellow, fg = a.bg },
--   b = { bg = colors.dark_white, fg = c.yellow },
--   c = { bg = a.float, fg = c.yellow },
-- }
-- 
-- myMelange.inactive = {
--   a = { bg = a.com, fg = a.bg },
--   b = { bg = colors.dark_white, fg = a.com, gui = 'bold' },
--   c = { bg = a.float, fg = a.com },
-- }

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
    self.status = ''
    self.applied_separator = ''
    self:apply_highlights(default_highlight)
    self:apply_section_separators()
    return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)

    for name, section in pairs(sections) do
        local left = name:sub(9, 10) < 'x'
        for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
            table.insert(section, pos * 2, { empty })
        end

        for id, comp in ipairs(section) do
            if type(comp) ~= 'table' then
                comp = { comp }
                section[id] = comp
            end
            comp.separator = left and { right = '' } or { left = '' }
        end

    end
    return sections
end

local function mode_and_search_result()
    local searchcount = vim.fn.searchcount { maxcount = 9999 }

    if searchcount.total == 0 then
        return require('lualine.utils.mode').get_mode()
    end
    return searchcount.current .. '/' .. searchcount.total
end

local function modified()
    if vim.bo.modified then
        return '+'
    elseif vim.bo.modifiable == false or vim.bo.readonly == true then
        return '-'
    end
    return ''
end

-- -- Tokyonight Lualine
-- require('lualine').setup {
--     options = {
--         theme = 'tokyonight',
--         component_separators = '',
--         --section_separators = { left = '', right = '' },
--         section_separators = '',
--         globalstatus = true
--     },
--     sections = process_sections {
--         lualine_a = { mode_and_search_result },
--         lualine_b = {
--             { 'filename', file_status = false, path = 1, color = { fg = colors.white, bg = colors.light_grey }},
--             { modified, color = { fg = colors.red, bg = colors.grey }},
--         },
--         lualine_c = { '%l:%c', '%p%%/%L' },
--         lualine_x = {
--             {
--                 'diagnostics',
--                 source = { 'nvim' },
--                 sections = { 'info' },
--                 diagnostics_color = { info = { fg = colors.grey, bg = colors.black } },
--             },
--             {
--                 'diagnostics',
--                 source = { 'nvim' },
--                 sections = { 'hint' },
--                 diagnostics_color = { hint = { fg = colors.grey, bg = colors.black } },
--             },
--             {
--                 'diagnostics',
--                 source = { 'nvim' },
--                 sections = { 'warn' },
--                 diagnostics_color = { warn = { fg = colors.orange, bg = colors.black } },
--             },
--             {
--                 'diagnostics',
--                 source = { 'nvim' },
--                 sections = { 'error' },
--                 diagnostics_color = { error = { fg = colors.red, bg = colors.black } },
--             },
-- 
--         },
--         lualine_y = {
--             {
--                 'diff',
--                 symbols = { added = ' ', modified = ' ', removed = ' ' },
--                 colored = true,
--                 diff_color = {
--                     added = { fg = colors.light_green, bg = colors.light_grey },
--                     modified = { fg = colors.orange, bg = colors.light_grey },
--                     removed = { fg = colors.red, bg = colors.light_grey }
--                 }
--             },
--             { 'branch', color = { bg = colors.light_grey }},
--             {
--                 '%w',
--                 cond = function()
--                     return vim.wo.previewwindow
--                 end,
--             },
--             {
--                 '%r',
--                 cond = function()
--                     return vim.bo.readonly
--                 end,
--             },
--             {
--                 '%q',
--                 cond = function()
--                     return vim.bo.buftype == 'quickfix'
--                 end,
--             },
--         },
--         lualine_z = {
--             { 'fileformat' , color = { fg = colors.black, bg = colors.light_grey } },
--             { 'filetype' , color = { fg = colors.black, bg = colors.blue }},
--         },
--     },
--     inactive_sections = {
--         lualine_c = { '%f %y %m' },
--         lualine_x = {},
--     },
--     tabline = {
--         lualine_a = {{
--             'tabs',
--             mode = 2,
--             tabs_color = {
--                 active = { fg = colors.blue, bg = colors.light_grey },
--                 inactive = { fg = colors.blue, bg = colors.grey },
--             },
--         }},
--     },
--     extensions = { 'quickfix' }
-- }


--Rose Pine Moon version
-- require('lualine').setup {
--     options = {
--         theme = myCustomRosePineMoon,
--         component_separators = '',
--         --section_separators = { left = '', right = '' },
--         section_separators = '',
--         globalstatus = true
--     },
--     sections = process_sections {
--         lualine_a = { mode_and_search_result },
--         lualine_b = {
--             { 'filename', file_status = false, path = 1, color = { fg = colors.subtle, bg = colors.overlay }},
--             { modified, color = { fg = colors.rose, bg = colors.surface }},
--         },
--         lualine_c = {{
--             '%l:%c',
--             '%p%%/%L',
--             color = { fg = colors.muted, bg = colors.surface }
--         }},
--         lualine_x = {
--             {
--                 'diagnostics',
--                 sources = { 'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic' },
--                 sections = { 'error', 'warn', 'hint', 'info'},
--                 diagnostics_color = {
--                     info = { fg = colors.foam, bg = colors.surface },
--                     hint = { fg = colors.iris, bg = colors.surface },
--                     warn = { fg = colors.gold, bg = colors.surface },
--                     error = { fg = colors.love, bg = colors.surface },
--                 },
--             },
-- 
--         },
--         lualine_y = {
--             {
--                 'diff',
--                 symbols = { added = ' ', modified = ' ', removed = ' ' },
--                 colored = true,
--                 diff_color = {
--                     added = { fg = colors.foam, bg = colors.overlay },
--                     modified = { fg = colors.rose, bg = colors.overlay },
--                     removed = { fg = colors.love,  bg = colors.overlay }
--                 }
--             },
--             { 'branch', color = { fg = colors.subtle, bg = colors.overlay }},
--             {
--                 '%w',
--                 cond = function()
--                     return vim.wo.previewwindow
--                 end,
--             },
--             {
--                 '%r',
--                 cond = function()
--                     return vim.bo.readonly
--                 end,
--             },
--             {
--                 '%q',
--                 cond = function()
--                     return vim.bo.buftype == 'quickfix'
--                 end,
--             },
--         },
--         lualine_z = { 'fileformat', 'filetype' },
--     },
--     tabline = {
--         lualine_a = {{
--             'tabs',
--             mode = 2,
--             tabs_color = {
--                 active = { fg = colors.subtle, bg = colors.overlay },
--                 inactive = { fg = colors.muted, bg = colors.surface },
--             },
--         }},
--     },
--     extensions = { 'quickfix' }
-- }

require('lualine').setup {
    options = {
        theme = 'kanagawa',
        component_separators = '',
        --section_separators = { left = '', right = '' },
        section_separators = '',
        globalstatus = true
    },
    sections = process_sections {
        lualine_a = { mode_and_search_result },
        lualine_b = {
            { 'filename', file_status = false, path = 1 },
            { modified },
        },
        lualine_c = {{
            '%l:%c',
            '%p%%/%L',
        }},
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic' },
                sections = { 'error', 'warn', 'hint', 'info'},
            },

        },
        lualine_y = {
            {
                'diff',
                symbols = { added = ' ', modified = ' ', removed = ' ' },
                colored = true,
            },
            { 'branch' },
            {
                '%w',
                cond = function()
                    return vim.wo.previewwindow
                end,
            },
            {
                '%r',
                cond = function()
                    return vim.bo.readonly
                end,
            },
            {
                '%q',
                cond = function()
                    return vim.bo.buftype == 'quickfix'
                end,
            },
        },
        lualine_z = { 'fileformat', 'filetype' },
    },
    -- tabline = {
    --     lualine_a = {{
    --         'tabs',
    --         mode = 2,
    --         tabs_color = {
    --             active = { fg = colors.bg, bg = colors.white },
    --             inactive = { fg = colors.white, bg = colors.black },
    --         },
    --     }},
    -- },
    extensions = { 'quickfix' }
}
