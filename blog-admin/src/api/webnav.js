import request from '@/utils/request'

export function getWebnav() {
    return request({
        url: '/system/webnav/list',
        method: 'get',
        params: {}
    })
}
export function update(data) {
    return request({
        url: '/system/webnav',
        method: 'post',
        data
    })
}
export function remove(id) {
    return request({
        url: '/system/webnav/',
        method: 'delete',
        params:{
            id:id
        }
    })
}

export function add(data) {
    return request({
        url: '/system/webnav/',
        method: 'POST',
        data
    })
}
export function info(id) {
    return request({
        url: '/system/webnav/info',
        method: 'get',
        params:{
            id:id
        }
    })
}


