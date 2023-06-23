async function addRipple(replyObj){
    const response = await axios.post(`/ripple/addRipple/`, replyObj);
    return response;
}

async function getListRipple(boardnum) {
    const response = await axios.get(`/ripple/getListRipple/${boardnum}`);
    return response;
}

async function deleteRipple(rippleid){
    const response = await axios.delete(`/ripple/deleteRipple/${rippleid}`);
    return response.data;
}