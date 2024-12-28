import axios from 'axios';

const BASE_URL = '/api/events';


export const getEventList = (pageNum=1,pageSize=5) => {
    return axios.get(`${BASE_URL}/listIds`,{
        params: {
            pageNum,
            pageSize
        }
    })
};
export const getEvents= (pageNum=1,pageSize=6) => {
    return axios.get(`${BASE_URL}/list`,{
        params: {
            pageNum,
            pageSize
        }
    })
};