import os
import json
from flask import Flask, render_template

app = Flask(__name__)

# Path to the state data JSON file
STATE_DATA_PATH = os.path.join(os.path.dirname(__file__), 'state_data.json')

@app.route('/')
def index():
    # Read the state data JSON file
    try:
        with open(STATE_DATA_PATH, 'r') as file:
            state_data = json.load(file)
    except FileNotFoundError:
        state_data = {"error": "state_data.json not found"}
    except json.JSONDecodeError:
        state_data = {"error": "Invalid JSON in state_data.json"}

    # Pass the state data to the template
    return render_template('index.html', state_data=state_data)

if __name__ == '__main__':
    # Run the Flask app (for development only)
    app.run(host='0.0.0.0', port=5000, debug=True)
