<strong>Requirements</strong>

1. Operating System

This script is designed for Linux-based systems (Ubuntu, Debian, etc.) and should work on any Unix-like system (macOS, etc.) with minimal changes.

2. Bash Shell

The script uses Bash as the default shell. It should work out of the box on most Linux distributions, as Bash is the default shell.


3. FFmpeg

FFmpeg must be installed on your system for the script to work.


To install FFmpeg on Ubuntu/Debian:

sudo apt update
sudo apt install ffmpeg

You can check if FFmpeg is installed by running:

ffmpeg -version

4. Permissions

Make sure you have write access to the output location. If you choose the predefined /root/subbed/, you may need root privileges to save files there.



---

Installation

1. Clone the repository or download the script

You can clone the repository to your local machine or simply download the sub.sh script.

git clone https://github.com/yourusername/subtitle-embedding-script.git
cd subtitle-embedding-script

2. Make the script executable

To ensure the script is executable, run the following command:

chmod +x sub.sh

3. Move the script to a directory in your PATH

For easier execution from anywhere in the terminal, move the script to /usr/local/bin (or another directory in your PATH):

sudo mv sub.sh /usr/local/bin/sub

4. Run the script

Now you can run the script simply by typing:

sub
