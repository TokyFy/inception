from flask import Flask, request
import subprocess
import logging

# Disable Flask/Werkzeug logs
log = logging.getLogger('werkzeug')
log.setLevel(logging.ERROR)

app = Flask(__name__)
app.logger.disabled = True

@app.route('/say', methods=['POST'])
def say():
    text = request.form.get('text') or request.json.get('text')
    if not text:
        return {"error": "No text provided"}, 400

    cmd = f'/usr/games/cowsay -f tux "{text}" | /usr/games/lolcat --force'
    subprocess.run(cmd, shell=True)
    return {"status": "Executed"}, 200

if __name__ == '__main__':
    # Run Flask silently
    app.run(host='0.0.0.0', port=80, debug=False, use_reloader=False)

