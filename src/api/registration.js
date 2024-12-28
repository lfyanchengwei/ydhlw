import axios from 'axios';

const BASE_URL = '/api/registration';

export const getRegistrationList = (eventId = '', pageNum = 1, pageSize = 5) => {
  return axios.get(`${BASE_URL}/listPending`, {
    params: { eventId, pageNum, pageSize },
  });
}    

export const updateRegistrationStatus = (registrationId, status) => {
  return axios.get(`${BASE_URL}/updateRegistrationStatus`, {
    params: { registrationId, status },
  });
};
