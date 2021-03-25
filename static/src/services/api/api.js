import axios from 'axios';

class HttpClient {
  constructor() {
    this.client = axios.create({
      baseURL: process.env.REACT_APP_API_SERVER,
      timeout: 10000,
      defaultInterceptors: true,
      headers: {
        Accept: 'application/json',
        'Content-Type': 'application/json',
      },
    });

    this.s3client = axios.create({
      timeout: 0,
    });

    this.client.interceptors.request.use(config => {
      const token = 'Bearer ' + window.localStorage.getItem('token');

      if (window.localStorage.getItem('token')) {
        config.headers.common['Authorization'] = token;
      }

      return config;
    });
  }

  doGet(url, config) {
    return this.client.get(url, config);
  }

  doPost(url, body, config) {
    return this.client.post(url, body, config);
  }

  doPatch(url, body, config) {
    return this.client.patch(url, body, config);
  }

  doPut(url, body, config) {
    return this.client.put(url, body, config);
  }

  doDelete(url, config) {
    return this.client.delete(url, config);
  }

  doS3upload(url, body, config) {
    return this.s3client.put(url, body, config)
  }
}

export default HttpClient;