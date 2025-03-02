from flask import Flask
import time

app = Flask(__name__)

def heavy_computation():
    # Simulate CPU load by performing an intensive calculation.
    total = 0
    for i in range(1, 1000000):
        total += i * i
    return total

@app.route('/')
def index():
    return "Hello, this is the autoscaling demo server."

@app.route('/simulate_load')
def simulate_load():
    start_time = time.time()
    heavy_computation()  # Perform the CPU-intensive task.
    elapsed = time.time() - start_time
    return f"Heavy computation complete. Time taken: {elapsed:.2f} seconds."

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
