For all urls except login

```
Headers:
Authorization: Bearer your_auth_token
```

Progressions
```
GET
http://127.0.0.1:8000/api/v1/getProgressionList/
```

Students list with search
```
GET
http://127.0.0.1:8000/api/v1/getStudentList/<int:progression_pk>/?name=<str>
example
http://127.0.0.1:8000/api/v1/getStudentList/1/?name=am
```

Students curriculum list
```
GET
http://127.0.0.1:8000/api/v1/getStudentCurriculumList/<int: progression pk>/<int: student pk>/
example
http://127.0.0.1:8000/api/v1/getStudentCurriculumList/1/3/
```

Clallenges
```
GET
http://127.0.0.1:8000/api/v1/getChallengeTypeList/
```

get challenges by students curriculum list
```
GET
http://127.0.0.1:8000/api/v1/getChallengesByStudentsCurriculumList/<int:student_pk>/<int:progression_pk>/<int:curriculum_pk>/

status: Choices(0,1)

example
http://127.0.0.1:8000/api/v1/getChallengesByStudentsCurriculumList/1/1/1/
```

Authorization
```
POST
http://127.0.0.1:8000/api/v1/api-token-auth/

Payload
username: <str>,
password: <str>
```

```
POST
http://127.0.0.1:8000/api/v1/update_challenge_status/

Payload:
challenge_id: <int>,
student_id: <int>,
passed: Choices(0,1)
active: Choices(0,1)
```
Get Challenge
```
GET
http://127.0.0.1:8000/api/v1/progression_students/<int:student_pk>/<int:challenge_pk>/'

Payload:
student_pk: <int>,
challenge_pk: <int>,
```
Get Current User (LoggedIn)
```
GET
http://127.0.0.1:8000/api/v1/getUser/
```
```
update env/lib/python3.7/site-packages/s3direct/static/s3direct/dist/index.js
p=function(e,t,n,r){var o=e.querySelector(".file-link"),a=e.querySelector(".file-url"),f=e.querySelector(".file-url-video");a.value=t+"/"+n+"/"+r,o.setAttribute("href",a.value),f.setAttribute("src",a.value),o.innerHTML=i(a.value).split("/").pop(),e.className="s3direct link-active",e.querySelector(".bar").style.width="0%",d(!1)}
```