-- Basic Lualine with no external plugins 

local function git_branch()
    local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    if string.len(branch) > 0 then
        return branch
    else
        return ":"
    end
end


-- Run :so $VIMRUNTIME/syntax/hitest.vim to check syntax highlight groups to set colors.

local function statusline()

    local set_color_1 = "%#Substitute#"

    local branch = git_branch()

    local set_color_2 = "%#StatusLine#"

    local file_name = " %f"

    local modified = " %m"

    local align_right = "%="

    local fileencoding = " %{&fileencoding?&fileencoding:&encoding}"

    local fileformat = "(%{&fileformat})"

    local filetype = " %y"

    local linecol = "%7( %l:%c %)"

    local percentage = " %3p%%"


    return string.format(

        "%s %s %s%s%s%s%s%s%s%s%s",

        set_color_1,

        branch,

        set_color_2,

        file_name,

        modified,

        align_right,

        filetype,

        fileencoding,

        fileformat,

        linecol,

        percentage

    )

end


vim.opt.statusline = statusline()

