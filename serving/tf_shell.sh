#!/bin/sh

sudo docker run -p 8501:8501 --mount type=bind,source=$(pwd)/models/FM,target=/models/FM -e MODEL_NAME=FM -t tensorflow/serving
export FLASK_APP=deploy_feat_flask.py
export FLASK_ENV=development
flask run

# flask run --port 8000
# curl -v ec2-34-218-238-185.us-west-2.compute.amazonaws.com:8000/info
# gunicorn -w 4 -b 0.0.0.0:5000 deploy_feat_flask:app
# python deploy_feat_request.py --data '{"user": [1, 1], "item": [1193, 1193], "sex": ["F", "F"], "age": [1, 1],
 "occupation": [10, 10], "title": [2452.0, 2452.0], "genre1": ["Drama", "Drama"], "genre2": ["missing", "missing"],
 "genre3": ["missing", "missing"]}' --algo FM --port 5000 --host ec2-34-218-238-185.us-west-2.compute.amazonaws.com


