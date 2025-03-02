import requests
import concurrent.futures
import time

# Update TARGET_URL with the specific VM instance's external IP.
TARGET_URL = 'http://34.134.77.179:8080/simulate_load'

def send_request():
    """Send a GET request to the TARGET_URL and return the response text."""
    try:
        response = requests.get(TARGET_URL)
        return response.text
    except Exception as e:
        return f"Request failed: {e}"

def generate_load(duration_seconds=60, concurrent_requests=50):
    """
    Generate load by sending concurrent requests over a period of time.
    
    :param duration_seconds: Total time (in seconds) to run the load generator.
    :param concurrent_requests: Number of concurrent requests per batch.
    """
    start_time = time.time()
    with concurrent.futures.ThreadPoolExecutor(max_workers=concurrent_requests) as executor:
        while time.time() - start_time < duration_seconds:
            # Fire off a batch of concurrent requests.
            futures = [executor.submit(send_request) for _ in range(concurrent_requests)]
            # Collect and print the results of all requests.
            results = [future.result() for future in futures]
            for result in results:
                print(result)
            # Short pause between batches.
            time.sleep(0.5)

if __name__ == "__main__":
    print("Starting load generation...")
    generate_load(duration_seconds=120, concurrent_requests=50)
    print("Load generation complete.")
