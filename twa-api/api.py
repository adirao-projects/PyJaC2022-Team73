from flask import Flask, jsonify, request

import requests
import json 

app = Flask(__name__)

# Large part thanks to the code form https://ishmeet1995.medium.com/run-a-uipath-job-using-python-e1d8bb9ed5e4

def getUserToken(url, user_data):
    data = requests.post(url, json=json.loads(user_data))
    authentication_data = json.loads(data.text)
    token = "Bearer " + str(authentication_data["result"])
    return token


def getProcessID(process_name, token):
    process_data = requests.get(f"https://platform.uipath.com/odata/Releases?$filter=ProcessKey+eq%20'{process_name}'",
                                headers={"Authorization": token})
    process_json = json.loads(process_data.text)
    # print(json.dumps(process_json, indent=2))
    process_ID = process_json["value"][0]["Key"]
    return process_ID


def getRobotID(robotName, token):
    robot_name = requests.get(f"https://platform.uipath.com/odata/Robots?$filter=Name%20eq%20'{robotName}'",
                              headers={"Authorization": token})
    robot_json_obj = json.loads(robot_name.text)
    robot_ID = robot_json_obj["value"][0]["Id"]
    return robot_ID

def runJob(process_ID, robot_ID, token, in_args):
    city_name = in_args[0]
    country_name = in_args[1]
    
    start_job_json = """
    { "startInfo":
       { "ReleaseKey": \"""" + process_ID + """\",
         "Strategy": "Specific",
         "RobotIds": [ """ + str(robot_ID) + """ ],
         "Source": "Manual",
         "InputArguments": "{'City_Name':'!!@!!', 'City_Country':'$$@$$'}"        
       }.
    }
    """.replace("!!@!!", city_name) 
    start_job_json = start_job_json.repalce("$$@$$", country_name)
     # InputArguments should be left {} or not included if workflow does not accept any input
    start_job_data = requests.post("https://platform.uipath.com/odata/Jobs/UiPath.Server.Configuration.OData.StartJobs",
                                   json=json.loads(start_job_json), headers={"Authorization": token})
    return start_job_data


@app.route("/", methods=['GET', 'POST'])
def index():
	if (request.method == 'POST'):
		some_json = request.get_json()
		return jsonify({'something': some_json})

	else:
		return jsonify({"about":"Hello World!"})


#@app.route('/getWeather/<str:city_name>/<str:country_name>', methods=['GET'])
def getWeather(city_name, country_name):
    tenant_name = "Aditya Rao"
    owner_name = "Aditya Rao"
    tenant_email  = "adityakrao.projects@gmail.com"
    tenant_password  = str(input("Please enter the Tenant Password: \n"))
    url = furl = r"https://platform.uipath.com/{owner_name}/{tenant_name}/api/Account/Authenticate"
    user_data = """
        {
        	"tenancyName": \"""" + tenant_name + """\",
        	"usernameOrEmailAddress": \"""" + tenant_email +"""\",
        }
        """
    token = getUserToken(url, user_data)
    print("Token = " + token)

    # ---Step 2. - Get PROCSS_ID of process you want to run---
    process_name = str(input("Please enter the Process Name: \n"))
    process_ID = getProcessID(process_name, token)
    print(f"Process ID = {process_ID}")

    # ---Step 3. - Get the ROBOT_ID of robot you want to run process on---
    robot_name = str(input("Please enter the Robot Name: \n"))
    robot_ID = getRobotID(robot_name, token)
    print(f"Robot ID = {robot_ID}")

    # ---Step 4. - START_Job---
    start_job_data = runJob(process_ID, robot_ID, token)
    print("Job Status = " + str(start_job_data))



    weather_data = runJob()




if __name__ == "__main__":
    getWeather('Toronto','Canada')
    #app.run(debug=True)