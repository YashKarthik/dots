local colors = {
    grey = '#292e42',
    light_grey = '#414868',
    black = '#15161e',
    white = '#c0caf5',
    red = '#f7768e',
    orange = '#e0af68',
    green = '#9ece6a',
    light_green = '#73daca',
    purple = '#bb9af7',
    blue = '#7aa2f7',
    light_blue = '#7dcfff',
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
        theme = 'tokyonight',
        component_separators = '',
        --section_separators = { left = '', right = '' },
        section_separators = '',
        globalstatus = true
    },
    sections = process_sections {
        lualine_a = { mode_and_search_result },
        lualine_b = {
            { 'filename', file_status = false, path = 1, color = { fg = colors.white, bg = colors.light_grey }},
            { modified, color = { fg = colors.red, bg = colors.grey }},
        },
        lualine_c = { '%l:%c', '%p%%/%L' },
        lualine_x = {
            {
                'diagnostics',
                source = { 'nvim' },
                sections = { 'info' },
                diagnostics_color = { info = { fg = colors.grey, bg = colors.black } },
            },
            {
                'diagnostics',
                source = { 'nvim' },
                sections = { 'hint' },
                diagnostics_color = { hint = { fg = colors.grey, bg = colors.black } },
            },
            {
                'diagnostics',
                source = { 'nvim' },
                sections = { 'warn' },
                diagnostics_color = { warn = { fg = colors.orange, bg = colors.black } },
            },
            {
                'diagnostics',
                source = { 'nvim' },
                sections = { 'error' },
                diagnostics_color = { error = { fg = colors.red, bg = colors.black } },
            },

        },
        lualine_y = {
            {
                'diff',
                symbols = { added = ' ', modified = ' ', removed = ' ' },
                colored = true,
                diff_color = {
                    added = { fg = colors.light_green, bg = colors.light_grey },
                    modified = { fg = colors.orange, bg = colors.light_grey },
                    removed = { fg = colors.red, bg = colors.light_grey }
                }
            },
            { 'branch', color = { bg = colors.light_grey }},
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
        lualine_z = {
            { 'fileformat' , color = { fg = colors.black, bg = colors.light_grey } },
            { 'filetype' , color = { fg = colors.black, bg = colors.blue }},
        },
    },
    inactive_sections = {
        lualine_c = { '%f %y %m' },
        lualine_x = {},
    },
    tabline = {
        lualine_a = {},
        lualine_b = {{ 'buffers', mode = 4}},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
    },
    extensions = { 'quickfix' }
}
