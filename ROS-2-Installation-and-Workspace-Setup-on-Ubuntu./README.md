Here’s a README text you can use for your GitHub repository that explains your script:

---

# ROS2 Installation Script for Ubuntu

This repository contains a bash script that automates the installation of ROS2 distributions on Ubuntu systems. The script supports the following versions:

- **ROS2 Jazzy Jalisco** for **Ubuntu 24.04.1 (Noble Numbat)**
- **ROS2 Humble Hawksbill** for **Ubuntu 22.04.5 LTS (Jammy Jellyfish)**

## Features

- **Interactive Execution**: The script prompts the user before running each command, allowing you to confirm or skip any step.
- **Locale Settings**: Configures UTF-8 locales for smooth operation.
- **Repository Setup**: Automatically adds the necessary ROS2 package repositories.
- **Gazebo Installation Fix**: Offers an option to fix potential issues with Gazebo installation after ROS2 setup.

## How to Use

1. Clone the repository:

   ```bash
   git clone https://github.com/Alprslnayhn/ROS2-Installation-Script-for-Ubuntu
   ```

2. Navigate to the repository directory:

   ```bash
   cd ROS2-Installation-Script-for-Ubuntu
   ```

3. Make the script executable:

   ```bash
   chmod +x ROS2_DOWNLOAD_TR.sh
   ```

4. Run the script:

   ```bash
   ./ROS2_DOWNLOAD_TR.sh
   ```

5. The script will ask you to select the Ubuntu version you're using and proceed with the corresponding ROS2 installation.

## Script Overview

### For Ubuntu 24.04.1 (Noble Numbat) – **Jazzy Jalisco**
- Installs the required locale packages.
- Adds the ROS2 Jazzy Jalisco repository and keys.
- Installs the ROS2 Jazzy desktop environment.
- Provides an option to resolve Gazebo installation issues.

### For Ubuntu 22.04.5 (Jammy Jellyfish) – **Humble Hawksbill**
- Installs locale settings.
- Adds the ROS2 Humble Hawksbill repository and keys.
- Installs the ROS2 Humble desktop environment.

## References

### Jazzy Jalisco:
- [ROS2 Jazzy Installation Guide](https://docs.ros.org/en/jazzy/Installation/Ubuntu-Install-Debs.html)
- [YouTube: ROS2 Jazzy Installation](https://www.youtube.com/watch?v=08o46x5SfJM)
- [YouTube: ROS2 Installation on Ubuntu](https://www.youtube.com/watch?v=dY8JxldcuqA)

### Humble Hawksbill:
- [ROS2 Humble Installation Guide](https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debs.html)

---

This text gives an overview of the script, how to use it, and provides the references included in your script. You can customize it further if needed!
