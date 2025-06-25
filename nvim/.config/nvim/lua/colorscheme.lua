local function transparent_bg()
    vim.api.nvim_set_hl(0, 'Normal', { bg=none })
    vim.api.nvim_set_hl(0, 'NonText', { bg=none })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg=none })
    vim.api.nvim_set_hl(0, 'StatusLine', { bg=none })
end

function colorscheme_set_dark()
    vim.cmd.colorscheme("github_dark")
    transparent_bg()
end

function colorscheme_set_light()
    vim.cmd.colorscheme("github_light")
    transparent_bg()
end

function colorscheme_set_xdg()
    local handle = io.popen([[gdbus call --session \
    --dest org.freedesktop.portal.Desktop \
    --object-path /org/freedesktop/portal/desktop \
    --method org.freedesktop.portal.Settings.Read \
    "org.freedesktop.appearance" "color-scheme"]])

    local result = handle and handle:read("*a")
    if handle then handle:close() end

    local theme = "dark"

    if result then
        local value = result:match("uint32 (%d)")
        if value == "0" then
            theme = "light"
        elseif value == "1" or value == "2" then
            theme = "dark"
        end
    end

    if theme == "light" then
        colorscheme_set_light()
    else
        colorscheme_set_dark()
    end
end


colorscheme_set_xdg()
