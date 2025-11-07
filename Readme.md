# 🛠️ My Personal Bash Aliases

This repository is a collection of my personal Bash aliases and functions that help streamline my development workflow. It starts with a simple but powerful alias for Git commits and pushes.

## 🚀 Alias: `gcp`

The `gcp` function allows me to quickly commit and push changes to GitHub with a formatted message. It supports commit types like `feat` and `bugfix`, and lets me write custom messages on the fly.

### 📄 Usage

```bash
gcp feat "add login functionality"
gcp bugfix "fix null pointer exception"
```

## 🐍 Alias: mkpy

The `mkpy` function is a productivity hack designed specifically for Python development. It creates a new Python file `(.py)` in your current directory, automatically populating it with a best-practice template.

This saves you the time of creating the file manually and typing out the standard Python entry point.

```bash
mkpy calculator_script
# Creates calculator_script.py with the template:
# def main():
#     print("Hello Main!")
#
# if __name__ == "__main__":
#     main()

mkpy setup.py
# Creates setup.py with the template (since it already ends in .py)
```

## 📌 Why This Repo Exists

This is the first personal alias I’ve created and decided to keep. As I continue to refine my workflow and discover other useful aliases, I’ll be uploading them here gradually.

## 🗂️ Future Plans

- Add aliases for Docker, Python, and system utilities

- Include setup instructions for sourcing these aliases

- Share tips and tricks for shell productivity

## 📂 Repository File Structure

To keep this repository clean and highly organized, all aliases and functions will be grouped by the technology they target. This modular approach makes it easy to source only the specific aliases you need.

- git-aliases.sh: Contains all Git-related aliases and functions (e.g., gcp).

- python-aliases.sh: Will contain functions like `mkpy` and any future Python-related shell commands.

- docker-aliases.sh: Reserved for future Docker and container utility functions.

Stay tuned!
