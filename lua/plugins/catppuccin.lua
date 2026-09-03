return {
    {
        'catppuccin/nvim', 
        name='catppuccin',
        config = function()
            -- Force 24-bit RGB truecolor support in terminal
            vim.opt.termguicolors = true

            local function get_system_theme_linux()
                local handle = io.popen("gdbus call --session --dest org.freedesktop.portal.Desktop --object-path /org/freedesktop/portal/desktop --method org.freedesktop.portal.Settings.Read org.freedesktop.appearance color-scheme 2>/dev/null")
                if not handle then return "dark" end
                local result = handle:read("*a") or ""
                handle:close()

                if result:match("uint32%s+1") or result:match("1") then
                    return "light"
                end
                return "dark"
            end

            local function get_system_theme_wsl()
                local handle = io.popen("cmd.exe /c 'cd /d %SYSTEMROOT% && reg query HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize /v AppsUseLightTheme' 2>/dev/null")
                if not handle then return "dark" end
                local result = handle:read("*a") or ""
                handle:close()

                local val = result:match("AppsUseLightTheme%s+REG_DWORD%s+(0x%d+)")
                if val == "0x1" then
                    return "light"
                end
                return "dark"
            end

            local function get_system_theme()
                if os.getenv("WSL_DISTRO_NAME") or os.getenv("WSL_INTEROP") then
                    return get_system_theme_wsl()
                end
                return get_system_theme_linux()
            end

            local flavor = (get_system_theme() == "dark") and "mocha" or "latte"

            require("catppuccin").setup({
                flavour = flavor,
            })

            vim.cmd.colorscheme("catppuccin")
        end,
    }
}
