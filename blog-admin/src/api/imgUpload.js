import request from '@/utils/request'

export function upload(data) {
  return request({
    url: '/ltw/file/upload',
    method: 'POST',
    headers:{'Content-Type': 'multipart/articles-data'},
    data
  })
}
export function delBatchFile(key) {
  return request({
    url: '/ltw/file/delBatchFile',
    method: 'POST',
    params:{
      key:key
    }
  })
}
