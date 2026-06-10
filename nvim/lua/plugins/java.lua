return {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
        local function start_jdtls()
            local jdtls = require("jdtls")
            local root_markers = {
                ".git",
                "mvnw",
                "gradlew",
                "pom.xml",
                "build.gradle",
                "build.gradle.kts",
                "settings.gradle",
                "settings.gradle.kts",
            }
            local root_dir = jdtls.setup.find_root(root_markers)

            if root_dir == nil or root_dir == "" then
                return
            end

            local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
            local project_hash = string.sub(vim.fn.sha256(root_dir), 1, 8)
            local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name .. "-" .. project_hash
            local runtimes = {}

            if vim.env.JAVA8_HOME and vim.env.JAVA8_HOME ~= "" then
                table.insert(runtimes, {
                    name = "JavaSE-1.8",
                    path = vim.env.JAVA8_HOME,
                    default = true,
                })
            end

            jdtls.start_or_attach({
                cmd = { "jdtls", "-data", workspace_dir },
                root_dir = root_dir,
                settings = {
                    java = {
                        configuration = {
                            runtimes = runtimes,
                        },
                        format = {
                            enabled = true,
                        },
                        import = {
                            gradle = {
                                enabled = true,
                            },
                            maven = {
                                enabled = true,
                            },
                        },
                    },
                },
            })
        end

        local group = vim.api.nvim_create_augroup("jdtls_config", { clear = true })

        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = "java",
            callback = start_jdtls,
        })

        if vim.bo.filetype == "java" then
            start_jdtls()
        end
    end,
}
