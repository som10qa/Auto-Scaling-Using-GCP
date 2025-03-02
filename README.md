# GCP Autoscaling Demo

This project demonstrates a simple autoscaling setup using a web server that simulates heavy CPU load and a load generator that triggers autoscaling in a GCP Managed Instance Group.

## Components

- **server.py:** A Flask web server that simulates a CPU-intensive task.
- **load_generator.py:** A script that generates load by sending concurrent requests to the web server.
- **requirements.txt:** Python dependencies.
- **VSCode Configuration:** Includes `launch.json` and `tasks.json` for easy debugging and task running in VSCode.

## How to Run

1. **Install Dependencies:**

   ```bash
   pip install -r requirements.txt
   python3 load_generator.py
