-- define your colorscheme here

-- Calculate theme with D-BUS (Linux only) If no theme located default to dark
local lightThemeId = "(<<uint322>>,)"
function get_system_theme ()
    local themeIdFile = io.popen("gdbus call --session --dest org.freedesktop.portal.Desktop --object-path /org/freedesktop/portal/desktop --method org.freedesktop.portal.Settings.Read org.freedesktop.appearance color-scheme")
    local themeId = themeIdFile:read("*a"):gsub("%s+", "")
    themeIdFile:close()
    if themeId == lightThemeId then
        return "light"
    end
    return "dark"
end

local theme = get_system_theme() == 'dark' and 'mocha' or 'latte'

require('catppuccin').setup({
    flavour = theme,
})

vim.cmd.colorscheme 'catppuccin'

