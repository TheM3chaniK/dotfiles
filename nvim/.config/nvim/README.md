# NeoVim
As you know neevim is the superior Code Editor. So here is the config folder of it. Everything is obviously self explantory except the none-ls Formatter setup so here it is explained underneath
## ⚡ Neovim Local Formatter Overrides

This setup lets you **keep your Neovim formatter config clean and versioned**,  
but easily override formatters locally — **without touching your tracked files**.

---

### ✅ How it works

- You always track at least **one formatter** (e.g. Stylua) in your main `none-ls` config.
- Any **extra formatters** (like `black` or `prettier`) live in a separate file that’s **gitignored**.
- If the local file is missing, your config still works fine with the fallback.

---

### 📂 **File structure**

Your `lua` folder should look like this:
```
nvim/
├── lua/
│ ├── plugins/
│ │ ├── none-ls.lua # main plugin config
| | ├── .... # other plugins
│ ├── null_ls_sources.lua # local overrides (gitignored!)
```

✅ **Key point:**  
- `none-ls.lua` lives in `lua/plugins/`.
- `null_ls_sources.lua` lives directly in `lua/` — *not* inside `plugins/`.

---

### ⚙️ **Untracked none_ls_sources**
the file **lua/none_ls_sources.lua** is untracked so the local sources doesnt get pushed

### Example local override (lua/null_ls_sources.lua)
```bash
local null_ls = require("null-ls")

return {
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.prettier,
}

```

### 📌 .gitignore
Be sure to add:

```bash
lua/null_ls_sources.lua
```
So your local tweaks never get pushed.




