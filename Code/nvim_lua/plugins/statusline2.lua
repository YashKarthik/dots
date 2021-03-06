local gl = require('galaxyline')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = gl.section
local link_purple = '#7651ad'
gl.short_line_list = {'NvimTree','vista','dbui','packer'}
local bg = '#3a405e'

gls.left[1] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
	local mode_color = {n = link_purple, i = colors.blue,v=colors.green,
                          [''] = colors.green,V=colors.green,
                          c = link_purple,no = colors.red,s = colors.orange,
                          S=colors.orange,[''] = colors.orange,
                          ic = colors.yellow,R = colors.orange,Rv = colors.orange,
                          cv = colors.red,ce=colors.red, r = colors.cyan,
                          rm = colors.cyan, ['r?'] = colors.cyan,
                          ['!']  = colors.red,t = colors.red}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return '▊ '
    end,
    highlight = {colors.red,bg,'bold'},
	}
}
gls.left[2] = {
	FileIcon = {
	  provider = 'FileIcon',
	  condition = condition.buffer_not_empty,
	  highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,bg},
	}
}

gls.left[3] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.magenta,'bold'}
	}
}

gls.left[4] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',bg},
    highlight = {colors.violet,bg,'bold'},
	}
}

gls.left[5] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.violet,bg,'bold'},
	}
}

gls.left[6] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green,bg},
	}
}
gls.left[7] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colors.orange,bg},
	}
}
gls.left[8] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red,bg},
	}
}

gls.mid[1] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,bg}
    }
}

gls.mid[2] = {
  Space = {
    provider = function () return ' ' end,
    highlight = {bg,bg},
	}
}

gls.mid[3] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,bg},
    }
}

gls.mid[4] = {
  Space = {
    provider = function () return ' ' end,
    highlight = {bg,bg},
	}
}

gls.mid[5] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.cyan,bg},
    }
}

gls.mid[7] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue,bg},
    }
}

gls.mid[8] = {
  Space = {
    provider = function () return ' ' end,
    highlight = {bg,bg},
	}
}

gls.mid[9] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' LSP:',
    highlight = {colors.red,bg,'bold'}
    }
}

gls.right[1] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',bg},
    highlight = {colors.green,bg,'bold'}
	}
}

gls.right[2] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',bg},
    highlight = {colors.green,bg,'bold'}
	}
}


gls.right[8] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
	local mode_color = {n = link_purple, i = colors.blue,v=colors.green,
                          [''] = colors.green,V=colors.green,
                          c = link_purple,no = colors.red,s = colors.orange,
                          S=colors.orange,[''] = colors.orange,
                          ic = colors.yellow,R = colors.orange,Rv = colors.orange,
                          cv = colors.red,ce=colors.red, r = colors.cyan,
                          rm = colors.cyan, ['r?'] = colors.cyan,
                          ['!']  = colors.red,t = colors.red}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return ' ▊'
    end,
    highlight = {colors.red,bg,'bold'},
	}
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',bg},
    highlight = {colors.blue,bg,'bold'}
	}
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,bg,'bold'}
	}
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,bg}
	}
}
gls.right[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = '|',
    separator_highlight = {'NONE',bg},
    highlight = {colors.fg,bg},
	}
}

gls.right[7] = {
  PerCent = {
    provider = 'LinePercent',
    separator = '',
    separator_highlight = {'NONE',bg},
    highlight = {colors.fg,bg,'bold'},
	}
}
