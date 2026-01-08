local opts = { 
		header = "megumin",
		user_path = vim.fn.stdpath("config") .. "/ascii",
}

require("alpha_ascii").setup(opts)
