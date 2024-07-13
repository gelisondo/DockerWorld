import json
from flask import Flask
app = Flask(__name__)

@app.route('/getMyInfo')
def getMyInfo():
    value = {
        "name": "NocheGeeks",
        "lastname": "TechNoir",
        "socialMedia":
        [
            {"facebookUser": "TechNoir"},
            {"instagramUser": "TechNoir"},
            {"xUser": "TechNoir 1972"},
            {"linkedin": "TechNoir T-800"},
            {"githubUser": "SkyNet"}
        ],
        "blog": "https://skynet.com",
        "author": "Sara Cohonor"
    }
    return json.dumps(value)

if __name__ == "__main__":
    app.run(port=5000)