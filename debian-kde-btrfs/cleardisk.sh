#!/bin/sh


confirm_and_continue() {
    echo "--------------------------------------------------"
    read -p "Did the process complete successfully? Do you want to continue? (y/n): " response
    case "$response" in
        [Yy]* )
            echo "Great! Moving on to the next step..."
            echo "--------------------------------------------------"
            ;;
        [Nn]* )
            echo "Process aborted by user. Exiting script."
            exit 1
            ;;
        * )
            echo "Invalid selection. Please enter 'y' or 'n'."
            confirm_and_continue # Re-asks the question if an invalid key is pressed
            ;;
    esac
}
