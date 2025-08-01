# Apple a Day 🍎

A system maintenance utility script for macOS that keeps your development environment fresh and up-to-date.

## Overview

This repository contains `bu.sh` (short for "brew update"), a comprehensive maintenance script designed to update and clean various package managers and system components on macOS. The script automates routine maintenance tasks to keep your development environment running smoothly.

## Features

- **Homebrew Management**: Updates, upgrades, and cleans Homebrew packages and casks
- **System Health Checks**: Runs `brew doctor` and `brew missing` for diagnostics
- **System Updates**: Installs macOS software updates
- **Extensible**: Includes commented sections for additional package managers (npm, pip, mas, etc.)

## Prerequisites

- macOS
- [Homebrew](https://docs.brew.sh/Installation) installed

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/apple-a-day.git
   cd apple-a-day
   ```

2. Make the script executable:
   ```bash
   chmod +x bu.sh
   ```

3. Run the script:
   ```bash
   ./bu.sh
   ```

## What the Script Does

The script performs the following operations in sequence:

1. **Homebrew Updates**:
   - Updates Homebrew itself
   - Upgrades all installed packages
   - Cleans up old versions and downloads
   - Upgrades all installed casks

2. **Health Checks**:
   - Runs `brew doctor` to check for issues
   - Checks for missing dependencies

3. **System Updates**:
   - Installs all available macOS software updates
   - Forces restart if required

## Optional Components

The script includes commented sections for additional package managers that can be enabled as needed:

- **Atom Package Manager** (apm)
- **Bower** and **npm** global packages
- **Mac App Store** updates via `mas`
- **Python pip** updates

To enable these features, uncomment the relevant lines in the script.

## Customization

Feel free to modify the script to suit your specific needs:

- Add or remove package managers
- Adjust cleanup preferences
- Include custom maintenance tasks
- Add logging or notifications

## License

This project is released under the Creative Commons CC0 1.0 Universal license. See [LICENSE](LICENSE) for details.

## Contributing

Contributions are welcome! Please feel free to submit issues, feature requests, or pull requests.

## Disclaimer

This script performs system-level operations. Please review the code before running and ensure you understand what each command does. Always backup your system before running maintenance scripts.