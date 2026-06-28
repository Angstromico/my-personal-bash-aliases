# 🛠️ My Personal Shell Aliases

This repository is a collection of my personal Shell functions and aliases that help streamline my development workflow. It includes utilities for Git, Python, Docker, Java, PHP, and more.

## 📌 Why This Repo Exists

This project started as a way to keep track of my most used commands and automate repetitive tasks. As I continue to refine my workflow, I’ll be uploading new aliases and functions here.

## 📂 Documentation

Detailed documentation for each category of aliases and functions can be found in the `docs/` folder:

- [🐙 Git Functions](docs/git-functions.md) - `gcp`, `git_init_push`, `generate_ssh_key`, etc.
- [🐍 Python Functions](docs/python-functions.md) - `mkpy`, `python`, `setup_pyenv`.
- [🐳 Docker Aliases](docs/docker-aliases.md) - `docker-start-img`, `checkdockport`.
- [☕ Java Functions](docs/java-functions.md) - `runjava`, `makejava`.
- [🐘 PHP Functions](docs/php-functions.md) - `mkphp`.
- [🖖 Vue Functions](docs/vue-functions.md) - `vbase`.
- [🏥 XAMPP Aliases](docs/xampp-aliases.md) - `xampp`, `xstart`, `xstop`, etc.
- [🚀 Postman Aliases](docs/postman-aliases.md) - `postman`.
- [⚙️ General Aliases](docs/generals-aliases.md) - `resetbash`.
- [⚙️ General Functions](docs/general-functions.md) - `checkport`.

## 🚀 Getting Started

To use these aliases, you can source the files in your `.bashrc` or `.zshrc`:

```bash
# Example: Source all .sh files in the repository
for file in ~/path/to/Bash-Aliases/*.sh; do
    source "$file"
done
```

After updating your configuration file, reload your shell:

```bash
source ~/.bashrc # or source ~/.zshrc
```

## 🐠 Fish Shell Support

Fish makes it extremely easy to create your own permanent terminal commands. See the [XAMPP docs](docs/xampp-aliases.md) or [PHP docs](docs/php-functions.md) for examples of Fish-specific functions.

Every file inside `~/.config/fish/functions/` automatically becomes a command:
- File name = command name
- File contents = function code

Stay tuned for more updates!
