-- jdtls is started from ftplugin rather than an autocmd because that is where
-- nvim-jdtls documents it, and the plugin's own troubleshooting assumes it.
local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
    return
end

local root_dir = vim.fs.root(0, { "gradlew", ".git", "mvnw" })
if not root_dir then
    return
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local jdtls_cache = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name

-- Without -configuration every project shares Mason's config directory.
local cmd = {
    "jdtls",
    "-configuration", jdtls_cache .. "/config",
    "-data", jdtls_cache .. "/workspace",
    "--jvm-arg=-Xms1g",
    "--jvm-arg=-Xmx2g",
}

-- Lombok rewrites sources at compile time, so without the agent jdtls reports
-- generated getters as missing.
-- $MASON is unset here because mason.nvim is lazy-loaded on :Mason.
local lombok_jar = vim.fn.stdpath("data") .. "/mason/share/jdtls/lombok.jar"
if vim.uv.fs_stat(lombok_jar) then
    table.insert(cmd, string.format("--jvm-arg=-javaagent:%s", lombok_jar))
end

local runtimes = {}
if vim.env.JAVA8_HOME and vim.env.JAVA8_HOME ~= "" then
    table.insert(runtimes, { name = "JavaSE-1.8", path = vim.env.JAVA8_HOME, default = true })
end

jdtls.start_or_attach({
    cmd = cmd,
    root_dir = root_dir,
    settings = {
        java = {
            configuration = { runtimes = runtimes },
            format = { enabled = true },
            import = {
                gradle = { enabled = true },
                maven = { enabled = true },
            },
            inlayHints = { parameterNames = { enabled = "all" } },
        },
    },
})
