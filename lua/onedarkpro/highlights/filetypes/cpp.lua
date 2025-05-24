local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config")

    return {
        -- 首先设置最高优先级的通用规则（在C++文件中生效）
        ["@variable"] = { fg = theme.palette.gray, style = config.styles.variables }, -- 所有变量默认为灰色
        ["@variable.member"] = { fg = theme.palette.red }, -- 成员变量为红色
        ["@variable.parameter"] = { fg = theme.palette.orange, style = config.styles.parameters }, -- 参数为红色
        ["@property"] = { fg = theme.palette.red }, -- 属性为红色
        
        -- C++ specific highlights (更具体的规则)
        ["@variable.cpp"] = { fg = theme.palette.gray, style = config.styles.variables }, -- 局部变量（灰色）
        ["@variable.member.cpp"] = { fg = theme.palette.red }, -- 类成员变量（红色）
        ["@variable.parameter.cpp"] = { fg = theme.palette.orange, style = config.styles.parameters }, -- 函数参数（橙色）

        -- C++ constants and types
        ["@constant.cpp"] = { fg = theme.palette.yellow },
        ["@constant.builtin.cpp"] = { fg = theme.palette.yellow },
        ["@function.builtin.cpp"] = { fg = theme.palette.cyan },
        ["@type.builtin.cpp"] = { fg = theme.palette.purple },
        ["@type.qualifier.cpp"] = { fg = theme.palette.purple },
        
        -- C++ specific keywords
        ["@keyword.operator.cpp"] = { fg = theme.palette.purple },
        ["@keyword.function.cpp"] = { fg = theme.palette.purple },
        ["@keyword.storage.cpp"] = { fg = theme.palette.purple }, -- const, static, extern, etc
        ["@keyword.modifier.cpp"] = { fg = theme.palette.purple }, -- explicit, virtual, override, etc
        ["@storageclass.cpp"] = { fg = theme.palette.purple }, -- storage class specifiers
        
        -- C++ namespace handling
        ["@namespace.cpp"] = { fg = theme.palette.gray }, -- TreeSitter namespace
        ["@module.cpp"] = { fg = theme.palette.gray }, -- 模块/命名空间
        
        -- LSP Semantic Tokens for C++
        ["@lsp.type.variable.cpp"] = { fg = theme.palette.white, style = config.styles.variables }, -- 局部变量
        ["@lsp.type.property.cpp"] = { fg = theme.palette.red }, -- 类成员变量（属性）
        ["@lsp.type.member.cpp"] = { fg = theme.palette.red }, -- 类成员
        ["@lsp.type.field.cpp"] = { fg = theme.palette.red }, -- 结构体/类字段
        ["@lsp.type.parameter.cpp"] = { fg = theme.palette.orange, style = config.styles.parameters }, -- 参数
        ["@lsp.type.method.cpp"] = { fg = theme.palette.blue, style = config.styles.methods }, -- 方法
        ["@lsp.type.class.cpp"] = { fg = theme.palette.yellow, style = config.styles.types }, -- 类
        ["@lsp.type.namespace.cpp"] = { fg = theme.palette.gray }, -- 命名空间改为灰色
        
        -- LSP type modifiers for better distinction
        ["@lsp.typemod.variable.local.cpp"] = { fg = theme.palette.gray, style = config.styles.variables }, -- 局部变量
        ["@lsp.typemod.variable.static.cpp"] = { fg = theme.palette.white}, -- 静态变量
        ["@lsp.typemod.variable.readonly.cpp"] = { fg = theme.palette.orange, style = config.styles.constants }, -- 只读变量
        ["@lsp.typemod.property.readonly.cpp"] = { fg = theme.palette.cyan }, -- 只读属性
        ["@lsp.typemod.function.defaultLibrary.cpp"] = { fg = theme.palette.cyan, style = config.styles.functions }, -- 标准库函数
        ["@lsp.typemod.method.defaultLibrary.cpp"] = { fg = theme.palette.cyan, style = config.styles.methods }, -- 标准库方法
        
        -- Additional C++ keyword overrides
        ["@lsp.type.keyword.cpp"] = { fg = theme.palette.purple }, -- LSP keywords
        ["@keyword.cpp"] = { fg = theme.palette.purple }, -- General keywords
        ["@keyword.storage.type.cpp"] = { fg = theme.palette.purple }, -- const, static, etc
    }
end

return M