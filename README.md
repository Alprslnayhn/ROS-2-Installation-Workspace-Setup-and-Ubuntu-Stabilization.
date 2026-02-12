# 🚀 ROS 2 Installation & Ubuntu Environment Setup

This project aims to **standardize the development infrastructure** across the team, eliminate installation errors (dependency hell), and **stabilize** the Ubuntu environment for robotics workflows.

## 🎯 Why Do We Need This?

Manual ROS 2 installation and workspace configuration are time-consuming and prone to errors. With these automation scripts, we aim for:

1.  **Standardization:** Ensuring all team members (and the robot) operate on the exact same ROS version, libraries, and `bash` configurations. Putting an end to the "It works on my machine" problem.
2.  **Speed:** Setting up a new computer or a freshly formatted system for development in minutes.
3.  **Performance & Stabilization:** Disabling unnecessary default Ubuntu services and automatically defining USB/Serial port permissions to ensure uninterrupted hardware communication (ESP32, Lidar, etc.).

## 🛠️ Features

This repository automates the following:
* **ROS 2 Installation:** Sets up necessary GPG keys, repositories, and main packages (Desktop Full).
* **Workspace Configuration:** Creates the standard `~/ros2_ws/src` directory structure and configures `colcon` settings.
* **Environment Settings:** Appends automatic `source` commands and developer aliases to `.bashrc`.
* **System Improvements:**
    * Grants serial port permissions (adds user to `dialout` group).
    * Installs essential developer tools (Git, VS Code extensions, Terminator, etc.).
    * Applies Network optimizations (DDS settings).

## 🚀 Installation & Usage

It is recommended to run the scripts on a **clean Ubuntu installation**.

```bash
# Clone the repository
git clone [https://github.com/Alprslnayhn/ROS-2-Installation-Workspace-Setup-and-Ubuntu-Stabilization.git](https://github.com/Alprslnayhn/ROS-2-Installation-Workspace-Setup-and-Ubuntu-Stabilization.git)
cd ROS-2-Installation-Workspace-Setup-and-Ubuntu-Stabilization

# Grant execution permission
chmod +x install.sh

# Start installation (Will ask for Sudo password)
./install.sh
