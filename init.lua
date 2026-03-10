require("eric.core")
require("eric.lazy")

vim.api.nvim_create_user_command("SynapseDevLoad", function()
    vim.opt.rtp:prepend("/Users/ericzhou03/Projects/synapse")

    for name, _ in pairs(package.loaded) do
        if name == "synapse" or name:match("^synapse%.") then
            package.loaded[name] = nil
        end
    end

    local ok, synapse = pcall(require, "synapse")
    if not ok then
        vim.notify("Synapse load failed: " .. tostring(synapse), vim.log.levels.ERROR)
        return
    end

    synapse.setup()
    vim.notify("Synapse loaded", vim.log.levels.INFO)
end, {})
