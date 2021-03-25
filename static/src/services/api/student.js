import HttpClient from './api';

class StudentAPI extends HttpClient {
    updatePhoto(studentId, data){
        return this.doPost(`update_student_photo/${studentId}/`, data)
    }
}

export default StudentAPI;