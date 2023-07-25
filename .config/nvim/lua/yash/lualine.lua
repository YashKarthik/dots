
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
local rosePineMoonColors = {
    base = "#232136",
    surface = "#2a273f",
    overlay = "#393552",
    muted = "#6e6a86",
    subtle = "#908caa",
    text = "#e0def4",
    love = "#eb6f92",
    gold = "#f6c177",
    rose = "#ea9a97",
    pine = "#3e8fb0",
    foam = "#9ccfd8",
    iris = "#c4a7e7",
    highlightLow = "#2a283e",
    highlightMed = "#44415a",
    highlightHigh = "#56526e",
}

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

local p = require('rose-pine.palette')

local myCustomRosePineMoon = {
	normal = {
		a = { bg = p.gold, fg = p.base },
		b = { bg = p.overlay, fg = p.rose },
		c = { bg = p.surface, fg = p.text },
	},
	insert = {
		a = { bg = p.foam, fg = p.base },
		b = { bg = p.overlay, fg = p.foam },
		c = { bg = p.surface, fg = p.text },
	},
	visual = {
		a = { bg = p.iris, fg = p.base },
		b = { bg = p.overlay, fg = p.iris },
		c = { bg = p.surface, fg = p.text },
	},
	replace = {
		a = { bg = p.pine, fg = p.base },
		b = { bg = p.overlay, fg = p.pine },
		c = { bg = p.surface, fg = p.text },
	},
	command = {
		a = { bg = p.rose, fg = p.base },
		b = { bg = p.overlay, fg = p.love },
		c = { bg = p.surface, fg = p.text },
	},
	inactive = {
		a = { bg = p.base, fg = p.muted },
		b = { bg = p.base, fg = p.muted },
		c = { bg = p.surface, fg = p.text },
	},
}


-- Rose Pine Moon version
require('lualine').setup {
    options = {
        theme = myCustomRosePineMoon,
        component_separators = '',
        --section_separators = { left = '', right = '' },
        section_separators = '',
        globalstatus = true
    },
    sections = process_sections {
        lualine_a = { mode_and_search_result },
        lualine_b = {
            { 'filename', file_status = false, path = 1, color = { fg = rosePineMoonColors.subtle, bg = rosePineMoonColors.overlay }},
            { modified, color = { fg = rosePineMoonColors.rose, bg = rosePineMoonColors.surface }},
        },
        lualine_c = {{
            '%l:%c',
            '%p%%/%L',
            color = { fg = rosePineMoonColors.muted, bg = rosePineMoonColors.surface }
        }},
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic' },
                sections = { 'error', 'warn', 'hint', 'info'},
                diagnostics_color = {
                    info = { fg = rosePineMoonColors.foam, bg = rosePineMoonColors.surface },
                    hint = { fg = rosePineMoonColors.iris, bg = rosePineMoonColors.surface },
                    warn = { fg = rosePineMoonColors.gold, bg = rosePineMoonColors.surface },
                    error = { fg = rosePineMoonColors.love, bg = rosePineMoonColors.surface },
                },
            },

        },
        lualine_y = {
            {
                'diff',
                symbols = { added = ' ', modified = ' ', removed = ' ' },
                colored = true,
                diff_color = {
                    added = { fg = rosePineMoonColors.foam, bg = rosePineMoonColors.overlay },
                    modified = { fg = rosePineMoonColors.rose, bg = rosePineMoonColors.overlay },
                    removed = { fg = rosePineMoonColors.love,  bg = rosePineMoonColors.overlay }
                }
            },
            { 'branch', color = { fg = rosePineMoonColors.subtle, bg = rosePineMoonColors.overlay }},
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
    tabline = {
        lualine_a = {{
            'tabs',
            mode = 2,
            tabs_color = {
                active = { fg = rosePineMoonColors.subtle, bg = rosePineMoonColors.overlay },
                inactive = { fg = rosePineMoonColors.muted, bg = rosePineMoonColors.surface },
            },
        }},
    },
    extensions = { 'quickfix' }
}
