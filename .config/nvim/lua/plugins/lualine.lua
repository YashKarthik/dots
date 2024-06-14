-- Current config in use
-- Old versions found in lua/yash/lualine.lua

local colors = {
    bg = "#292522",
    fg = "#ECE1D7",
    bright_black = "#867462",
    bright_blue = "#A3A9CE",
    bright_cyan = "#89B3B6",
    bright_green = "#85B695",
    bright_magenta = "#CF9BC2",
    bright_red = "#D47766",
    bright_white = "#ECE1D7",
    bright_yellow = "#EBC06D",
    dark_black = "#292522",
    dark_blue = "#273142",
    dark_cyan = "#253333",
    dark_green = "#233524",
    dark_magenta = "#422741",
    dark_red = "#7D2A2F",
    dark_white = "#403A36",
    dark_yellow = "#8B7449",
    black = "#34302C",
    blue = "#7F91B2",
    cyan = "#7B9695",
    green = "#78997A",
    magenta = "#B380B0",
    red = "#BD8183",
    white = "#C1A78E",
    yellow = "#E49B5D"
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

require('lualine').setup {
    options = {
        theme = 'gruvbox-material',
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
    tabline = {
        lualine_a = {{
            'tabs',
            mode = 2,
            tabs_color = {
                active = { fg = colors.bg, bg = colors.white },
                inactive = { fg = colors.white, bg = colors.black },
            },
        }},
    },
    extensions = { 'quickfix' }
}
