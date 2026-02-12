Here’s a more concise and English version of the README for your script:

---

# ROS 2 Workspace Setup Script

This script helps automate the setup of your ROS 2 workspace, including installing dependencies, building the workspace, and setting up environment variables.

## Features

- Specify your ROS 2 workspace directory
- Install necessary dependencies (`rosdep install`)
- Build the workspace (`colcon build`)
- Add `setup.bash` to your `.bashrc` for automatic sourcing

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/Alprslnayhn/ROS-2-Workspace-Setup-Script.git
   cd ROS-2-Workspace-Setup-Script.git
   ```

2. Run the script:
   ```bash
   chmod +x install_rosdep.sh
   ./install_rosdep.sh
   ```

3. Follow the prompts in the terminal to complete the setup.



## Notes

- **Coloring**: Questions and responses are color-coded for easier readability.
- **System Requirements**: The script assumes ROS 2 and `colcon` are already installed.
