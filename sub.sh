#!/bin/bash

# Function to prompt for an existing MP4 file
get_input_file() {
    local file
    while true; do
        read -p "Enter the MP4 filename or full path: " file
        if [ -f "$file" ]; then
            echo "$file"
            return
        else
            echo "Error: File '$file' not found! Please try again."
        fi
    done
}

# Function to prompt for output directory
get_output_directory() {
    echo "Select output location:"
    echo "1) Define location"
    echo "2) /root/subbed/"
    read -p "Enter your choice (1 or 2): " choice
    case $choice in
        1)
            read -p "Enter the output directory (full path): " dir
            # Check if directory exists, if not, create it
            if [ ! -d "$dir" ]; then
                echo "Directory '$dir' not found. Creating it now..."
                mkdir -p "$dir"  # Create directory if it doesn't exist
                if [ $? -eq 0 ]; then
                    echo "Directory created: $dir"
                else
                    echo "Error: Could not create directory. Exiting."
                    exit 1
                fi
            fi
            echo "$dir"
            ;;
        2)
            echo "/root/subbed/"
            ;;
        *)
            echo "Invalid option. Exiting."
            exit 1
            ;;
    esac
}

# Get the MP4 input file
input_file=$(get_input_file)

# Extract the directory and filename
input_dir=$(dirname "$input_file")
input_filename=$(basename "$input_file")

# Generate subtitle filename (same directory as MP4)
subtitle_file="$input_dir/${input_filename%.*}.srt"

# Check if subtitle file exists
if [ ! -f "$subtitle_file" ]; then
    echo "Error: Subtitle file '$subtitle_file' not found in the same directory as the MP4!"
    exit 1
fi

# Get the output directory
output_dir=$(get_output_directory)

# Extract filename without extension and append "sub.mp4"
output_filename="${input_filename%.*}sub.mp4"

# Full path for output file
output_file="$output_dir/$output_filename"

# Run FFmpeg command
echo "Processing, please wait..."
ffmpeg -threads 8 -i "$input_file" -vf "subtitles=$subtitle_file" -c:v libx264 -preset fast -crf 23 -c:a copy "$output_file"

# Notify user when done
echo "Subtitle embedding completed! Saved as: $output_file"
