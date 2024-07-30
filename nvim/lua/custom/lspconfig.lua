-- ~/.config/nvim/lua/custom/lspconfig.lua

local lspconfig = require("lspconfig")
local jdtls = require("jdtls")

-- Set the Java LSP configuration
local function setup_java()
  local root_markers = {'.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'}
  local root_dir = require('jdtls.setup').find_root(root_markers)
  local home = os.getenv('HOME')
  local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

  local config = {
    cmd = {
      'java', -- or '/path/to/java11_or_newer/bin/java'
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xms1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      '-jar', home .. '/path/to/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
      '-configuration', home .. '/path/to/eclipse.jdt.ls/config_linux',
      '-data', workspace_folder,
    },

    root_dir = root_dir,
    settings = {
      java = {
        configuration = {
          runtimes = {
            {
              name = "JavaSE-11",
              path = "/path/to/java-11",
            },
            {
              name = "JavaSE-17",
              path = "/path/to/java-17",
            },
          },
        },
      },
    },
    init_options = {
      bundles = {},
    },
  }

  jdtls.start_or_attach(config)
end

-- Attach Java LSP to Java files
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"java"},
  callback = setup_java,
})

