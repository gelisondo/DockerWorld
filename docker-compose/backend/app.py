from flask import Flask,jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/getMyInfo')
def getMyInfo():
    value = {
        "name": "Guillermo",
        "lastname": "Elisondo",
        "socialMedia":
        {
            "facebookUser": "señorX",
            "instagramUser": "señorZ",
            "xUser": "noJuega",
            "linkedin": "comodoro",
            "githubUser": "segaGenesis"
        },
        "blog": "https://1world2geeks.enba.edu.uy",
        "author": "Guillermo Elisondo"
    }

    return jsonify(value)

if __name__ == '__main__':
    app.run(port=5000)