function SetFiletype()
    local fileType = vim.bo.filetype
    local newFileType = vim.fn.input("Current filetype: " .. fileType .. ". New filetype: ")
    if newFileType ~= "" then
        vim.cmd("set filetype=" .. newFileType)
    end
end

vim.keymap.set("n", "<leader>sf", function() SetFiletype() end)

function GetCurrentFileLocation()
    vim.cmd("echo expand('%:p')")
end

vim.cmd([[command! FileLocation lua GetCurrentFileLocation()]])
